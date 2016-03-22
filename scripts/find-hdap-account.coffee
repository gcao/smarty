# Description:
#   hubot find a <STATUS> account in <ENVIRONMENT>
#

uuid   = require 'node-uuid'
R      = require 'ramda'
client = require '../lib/shared-stomp-client'

module.exports = (robot) ->

  robot.respond /find (a|an)( active| suspended| canceled|) account in (\w+)/i, (msg) ->
    console.log "======== Find hdap account ========"

    task =
      id: uuid.v4()
      source:
        reply_to: msg.message.user.reply_to
        room: msg.message.room
      type: 'find-hdap-account'
      status: R.trim msg.match[2]
      environment: msg.match[3].toLowerCase()

    console.log task
    client.publish "/topic/tasks", JSON.stringify(task)

