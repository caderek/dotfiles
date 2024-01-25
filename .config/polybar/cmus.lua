local handle = io.popen("cmus-remote -C status")

local function split(str, delimiter)
	local chunks = {}

	for chunk in str:gmatch(delimiter) do
		table.insert(chunks, chunk)
	end

	return chunks
end

if handle then
	local result = handle:read("*a")
	handle:close()

	local lines = split(result, "[^\r\n]+")

	local tags = {}

	for _, line in ipairs(lines) do
		if line:match("^status") then
			tags.status = split(line, "[^ ]+")[2]
		elseif line:match("^tag") then
			local chunks = split(line, "[^ ]+")
			local key = chunks[2]
			local val = table.concat(chunks, " ", 3)
			tags[key] = val
		end
	end

	if tags.status == "stopped" then
		print(" Not playing")
	elseif tags.title or tags.artist then
		local icon = tags.status == "paused" and " " or " "
		print(icon .. " " .. (tags.title or "Unknown") .. " - " .. (tags.artist or "unknown"))
	end
end
