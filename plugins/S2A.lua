local function run(msg, matches)
	if matches[1] == 'S2' and is_admin(msg) then
		local response = matches[3]
		send_large_msg("chat#id"..matches[2], response)
	end
	if matches[1] == 'S2A' then
		if is_admin(msg) then -- Only sudo !
			local data = load_data(_config.moderation.data)
			local groups = 'groups'
			local response = matches[2]
			for k,v in pairs(data[tostring(groups)]) do
				chat_id =  v
				local receiver = 'chat#id'..chat_id
				send_large_msg(receiver, response)
			end
		end
	end
end
return {
  patterns = {
    "^[!/](S2A) +(.+)$",
    "^[!/](S2) (%d+) (.*)$"
  },
  run = run
}
