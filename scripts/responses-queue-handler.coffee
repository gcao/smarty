amqp = require 'amqplib'

module.exports = (robot) ->
  #try
  #  robot.messageRoom "30164_room_98@conf.hipchat.com", "Test"
  #  #robot.send {user: "30164_2988585@chat.hipchat.com"}, "Test"
  #catch err
  #  console.log err

  amqp.connect(process.env.AMQP_URL).then (conn) ->
    conn.createChannel().then (channel) ->
      channel.assertQueue 'responses'
      channel.consume(
        'responses'
        , (msg) ->
          console.log msg.content.toString()
          obj = JSON.parse msg.content.toString()
          if obj.room
            #robot.send {room: obj.reply_to}, obj.content

            # Hard-coding room Jabber ID for testing purpose
            # TODO map reply-to to room jabber id
            robot.messageRoom "30164_room_98@conf.hipchat.com", obj.content
          else
            robot.send {user: obj.reply_to}, obj.content
        , {noAck: true}
      )

