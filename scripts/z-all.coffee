# Commands:
#   hubot anything
#

uuid  = require 'node-uuid'
Stomp = require('stomp-client')

client = new Stomp
  host: process.env.STOMP_SERVER
  port: process.env.STOMP_PORT
  user: process.env.STOMP_USERNAME
  pass: process.env.STOMP_PASSWORD

client.connect()

module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    console.log "======== CATCH ALL ========"
    console.log msg.match[1]
    console.log msg.message

    request =
      id: uuid.v4()
      source:
        reply_to: msg.message.user.reply_to
        room: msg.message.room
      message: msg.match[1]

    client.publish "/topic/requests", JSON.stringify(request)

