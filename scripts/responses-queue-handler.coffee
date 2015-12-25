amqp = require 'amqplib'
when_ = require 'when'

module.exports = (robot) ->
  #robot.messageRoom "30164_room_98@chat.hipchat.com", "Test"
  #robot.send {room: "30164_room_98@chat.hipchat.com"}, "Test"
  #robot.send {user: "30164_2988585@chat.hipchat.com"}, "Test"

  amqp.connect(process.env.AMQP_URL).then (conn) ->
    when_ conn.createChannel().then (channel) ->
      channel.assertQueue 'responses'
      channel.consume(
        'responses'
        , (msg) ->
          console.log msg.content.toString()
          obj = JSON.parse msg.content.toString()
          if obj.room
            robot.send {room: obj.reply_to}, obj.content
          else
            robot.send {user: obj.reply_to}, obj.content
        , {noAck: true}
      )

