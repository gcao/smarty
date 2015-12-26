# Description:
#   hubot check disk space
#

uuid = require 'node-uuid'
amqp = require 'amqplib'
when_ = require 'when'

module.exports = (robot) ->
  robot.respond /check disk space/i, (msg) ->
    amqp.connect(process.env.AMQP_URL).then (conn) ->
      when_(
        conn.createChannel().then(
          (channel) ->
            channel.assertQueue 'tasks'
            console.log msg.message

            task =
              id: uuid.v4()
              type: 'check-disk-space'
              server: 'TODO'
              reply_to: msg.message.user.reply_to
              room: msg.message.room

            console.log task
            channel.sendToQueue('tasks', new Buffer(JSON.stringify(task)))
        )
      )#.ensure(-> conn.close())

