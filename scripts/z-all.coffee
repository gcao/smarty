# Commands:
#   hubot anything
#

uuid  = require 'node-uuid'

client = require '../lib/shared-stomp-client'

module.exports = (robot) ->
  #robot.respond /(.*)/i, (msg) ->
  robot.catchAllAddressed (msg) ->
    console.log "======== CATCH ALL ========"
    console.log msg.match[1]
    console.log msg.message

    request =
      id: uuid.v4()
      source:
        id: msg.message.user.id
        jid: msg.message.user.jid
        name: msg.message.user.name
        mention_name: msg.message.user.mention_name
        email_address: msg.message.user.email_address
        reply_to: msg.message.user.reply_to
        room: msg.message.room
      message: msg.match[1]

    client.publish "/topic/requests", JSON.stringify(request)

