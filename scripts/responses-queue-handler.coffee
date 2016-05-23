client = require '../lib/shared-stomp-client'

module.exports = (robot) ->
  client.connect ->
    client.subscribe "/topic/responses", (body, headers) ->
      console.log "======== RESPONSE ========"
      console.log body
      {source, content} = JSON.parse body
      if source.room
        robot.messageRoom source.reply_to, "@#{source.mention_name} #{content}"
      else
        robot.send {user: source.reply_to}, content

