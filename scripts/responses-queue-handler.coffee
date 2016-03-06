amqp = require 'amqplib'

module.exports = (robot) ->
  amqp.connect(process.env.AMQP_URL).then (conn) ->
    conn.createChannel().then (ch) ->
      ex = ch.assertExchange('responses-x', 'fanout')
      ch.bind(ex)
      ch.consume(
        'responses'
        , (msg) ->
          console.log "======== RESPONSE ========"
          console.log msg.content.toString()
          {source: {reply_to, room}, content} = JSON.parse msg.content.toString()
          if room
            robot.messageRoom reply_to, content
          else
            robot.send {user: reply_to}, content
        , {noAck: true}
      )

