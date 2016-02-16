amqp = require 'amqplib'

module.exports = (robot) ->
  amqp.connect(process.env.AMQP_URL).then (conn) ->
    conn.createChannel().then (channel) ->
      channel.assertQueue 'responses'
      channel.consume(
        'responses'
        , (msg) ->
          console.log msg.content.toString()
          obj = JSON.parse msg.content.toString()
          if obj.room
            robot.messageRoom obj.reply_to, obj.content
          else
            robot.send {user: obj.reply_to}, obj.content
        , {noAck: true}
      )

