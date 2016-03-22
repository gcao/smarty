# Commands:
#   hubot anything
#

uuid  = require 'node-uuid'

client = require '../lib/shared-stomp-client'

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

