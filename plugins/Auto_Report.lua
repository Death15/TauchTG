local function run(msg)
  if msg.service and msg.action.type == 'chat_add_user' then
    local data = load_data(_config.moderation.data)
    if not data[tostring(msg.to.id)] then
      print "You Have Been Reported Becuse Inviting With ID!."
      block_user('user#id'..msg.from.id,ok_cb, false)
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
