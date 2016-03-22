Stomp = require('stomp-client')

client = new Stomp
  host: process.env.STOMP_SERVER
  port: process.env.STOMP_PORT
  user: process.env.STOMP_USERNAME
  pass: process.env.STOMP_PASSWORD

# connect() is called in responses-queue-handler.coffee
#client.connect()

module.exports = client

