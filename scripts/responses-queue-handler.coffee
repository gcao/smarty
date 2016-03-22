client = require '../lib/shared-stomp-client'

module.exports = (robot) ->
  client.connect ->
    client.subscribe "/topic/responses", (body, headers) ->
      console.log "======== RESPONSE ========"
      console.log body
      {source: {reply_to, room}, content} = JSON.parse body
      if room
        robot.messageRoom reply_to, content
      else
        robot.send {user: reply_to}, content

