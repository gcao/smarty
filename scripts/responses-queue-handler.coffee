Stomp = require('stomp-client')

module.exports = (robot) ->
  client = new Stomp
    host: process.env.STOMP_SERVER
    port: process.env.STOMP_PORT
    user: process.env.STOMP_USERNAME
    pass: process.env.STOMP_PASSWORD

  client.connect ->
    client.subscribe "/topic/responses", (body, headers) ->
      console.log "======== RESPONSE ========"
      console.log body
      {source: {reply_to, room}, content} = JSON.parse body
      if room
        robot.messageRoom reply_to, content
      else
        robot.send {user: reply_to}, content

