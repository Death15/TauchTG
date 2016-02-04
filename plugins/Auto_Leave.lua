local function run(msg)
  if msg.service and msg.action.type == 'chat_add_user' then
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)] then
      print "This Group Is Not Added."
      chat_del_user("chat#id"..msg.to.id, 'user#id'..177958856, ok_cb, false)
    end
  end
end

return {
  description = "reporting Inviters.",
  usage = "Reporting Users",
  patterns = {
    "^!!tgservice (.+)$"
  },
  run = run
}
--by @AraashTauch :)
