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

	local icon = tags.status == "playing" and " " or " "

	local ui = "%{A1:cmus-remote -u:} "
		.. icon
		.. "%{A} "
		.. "%{A1:cmus-remote -r:} %{A} "
		.. "%{A1:cmus-remote -n:} %{A} "
		.. "%{A1:cmus-remote -R:}󰑖 %{A} "
		.. "%{A1:cmus-remote -S:}󰒟 %{A} "
		.. "%{A1:cmus-remote -v -10%:} %{A} "
		.. "%{A1:cmus-remote -v +10%:} %{A} "

	if tags.artist or tags.title then
		ui = ui .. "| " .. (tags.title or "Unknown") .. " - " .. (tags.artist or "unknown")
	end

	print(ui)
end
