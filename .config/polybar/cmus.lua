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
		elseif line:match("^tag") or line:match("^set") then
			local chunks = split(line, "[^ ]+")
			local key = chunks[2]
			local val = table.concat(chunks, " ", 3)
			tags[key] = val
		end
	end

	local vol = tonumber(tags.vol_left)

	local volPretty = vol == 0 and "MIN" or (vol == 100 and "MAX" or (tostring(vol) .. "%"))

	local iconPlayPause = tags.status == "playing" and " " or " "
	local iconShuffle = tags.shuffle == "true" and "󰒟 " or "%{F#6c7086}󰒟 %{F#cba6f7}"
	local iconRepeat = ""

	local commandRepeat = ""

	if tags.repeat_current == "true" then
		iconRepeat = "%{F#a6e3a1}󰑘 %{F#cba6f7}"
		commandRepeat = "bash ~/.config/polybar/cmus-repeat.sh"
		if tags["repeat"] == "true" then
			commandRepeat = commandRepeat .. "&& cmus-remote -R"
		end
	elseif tags["repeat"] == "true" then
		iconRepeat = "󰑖 "
		commandRepeat = "bash ~/.config/polybar/cmus-repeat.sh"
	else
		iconRepeat = "%{F#6c7086}󰑖 %{F#cba6f7}"
		commandRepeat = "cmus-remote -R"
	end

	local ui = "%{A1:cmus-remote -u:}%{T2}" .. iconPlayPause .. "%{T-}%{A}"

	if tags.status ~= "stopped" then
		ui = ui
			.. "%{A1:cmus-remote -r:}%{T2} %{T-}%{A}"
			.. "%{A1:cmus-remote -n:}%{T2} %{T-}%{A}"
			.. "%{A1:"
			.. commandRepeat
			.. ":}%{T2}"
			.. iconRepeat
			.. "%{T-}%{A}"
			.. "%{A1:cmus-remote -S:}%{T2}"
			.. iconShuffle
			.. "%{T-}%{A}"
			.. "%{F#585b70}| %{F#cba6f7}"
			.. "%{A1:cmus-remote -v -10%:}%{T2} %{T-}%{A}%{F#cdd6f4}"
			.. volPretty
			.. " %{F#cba6f7}%{A1:cmus-remote -v +10%:}%{T2} %{T-}%{A}"
	end

	if tags.artist or tags.title then
		local MAX_LEN = 40
		local info = (tags.title or "Unknown") .. " - " .. (tags.artist or "unknown")
		local command = "echo " .. info .. " | xclip -sel clip"
		local trimmed = #info > MAX_LEN and (info:sub(1, MAX_LEN - 3) .. "...") or info

		-- if you click the song description it will be copied to the clipboard
		ui = ui .. "%{F#585b70}| %{F#cba6f7}%{A1:" .. command .. ":}%{T1}" .. trimmed .. "%{T-}%{A}"
	else
		ui = ui .. "%{T1}Not playing%{T-}"
	end

	print(ui)
end
