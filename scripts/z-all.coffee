# Commands:
#   hubot anything
#

uuid  = require 'node-uuid'
amqp  = require 'amqplib'
when_ = require 'when'

module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    console.log "======== CATCH ALL ========"
    console.log msg.match[1]
    console.log msg.message

    amqp.connect(process.env.AMQP_URL).then (conn) ->
      when_(
        conn.createChannel().then(
          (channel) ->
            channel.assertQueue 'requests'

            request =
              id: uuid.v4()
              source: {
                reply_to: msg.message.user.reply_to
                room: msg.message.room
              },
              message: msg.match[1]

            channel.sendToQueue('requests', new Buffer(JSON.stringify(request)))
        )
      )#.ensure(-> conn.close())

