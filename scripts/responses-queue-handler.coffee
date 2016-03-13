#amqp = require 'amqplib'

Stomp = require('stomp-client')

module.exports = (robot) ->

  client = new Stomp "localhost", 61613, "admin", "admin"
  client.connect ->
    client.subscribe "/topic/responses", (body, headers) ->
      console.log "======== RESPONSE ========"
      console.log body
      {source: {reply_to, room}, content} = JSON.parse body
      if room
        robot.messageRoom reply_to, content
      else
        robot.send {user: reply_to}, content

  #amqp.connect(process.env.AMQP_URL).then (conn) ->
  #  conn.createChannel().then (ch) ->
  #    ex = ch.assertExchange('responses-x', 'fanout')
  #    ch.bind(ex)
  #    ch.consume(
  #      'responses'
  #      , (msg) ->
  #        console.log "======== RESPONSE ========"
  #        console.log msg.content.toString()
  #        {source: {reply_to, room}, content} = JSON.parse msg.content.toString()
  #        if room
  #          robot.messageRoom reply_to, content
  #        else
  #          robot.send {user: reply_to}, content
  #      , {noAck: true}
  #    )

