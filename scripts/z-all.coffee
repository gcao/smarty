# Commands:
#   hubot anything
#

uuid  = require 'node-uuid'
#amqp  = require 'amqplib'
#when_ = require 'when'

Stomp = require('stomp-client')

client = new Stomp "localhost", 61613, "admin", "admin"

module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    console.log "======== CATCH ALL ========"
    console.log msg.match[1]
    console.log msg.message

    client.connect ->
      console.log 'publishing'
      request =
        id: uuid.v4()
        source:
          reply_to: msg.message.user.reply_to
          room: msg.message.room
        message: msg.match[1]

      client.publish "/topic/requests", JSON.stringify(request)

    #amqp.connect(process.env.AMQP_URL).then (conn) ->
    #  when_(
    #    conn.createChannel().then(
    #      (ch) ->
    #        request =
    #          id: uuid.v4()
    #          source: {
    #            reply_to: msg.message.user.reply_to
    #            room: msg.message.room
    #          },
    #          message: msg.match[1]

    #        #ex = ch.assertExchange('requests-x', 'fanout')
    #        ch.publish('requests-x', 'requests', new Buffer(JSON.stringify(request)))
    #    )
    #  )#.ensure(-> conn.close())

