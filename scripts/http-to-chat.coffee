http        = require('http')
querystring = require('querystring')

# TODO no auth token is obtained and this is not tested yet
# TODO expose a function to be called by other scripts in Hubot
# TODO Use this instead https://github.com/germanrcuriel/hipchat-client

# https://github.com/hipchat/hubot-hipchat/issues/24#issuecomment-5410146
module.exports = (robot) ->
  robot.router.post '/say-in-room/:room', (req, res) ->
    post_data = querystring.stringify
      room_id: req.params.room
      message: "#{req.body.from} - #{req.body.subject}<br>#{req.body.html}"
      #from: "Hubot"

    post_options = {
      host: 'api.hipchat.com',
      port: 80,
      path: '/v1/rooms/message?auth_token=' + process.env.HIPCHAT_AUTH_TOKEN,
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': post_data.length
      }
    }

    post_req = http.request post_options, (res) ->
      res.on 'data', (chunk) ->
        console.log('Response: ' + chunk)
    post_req.write post_data
    post_req.end()
    res.writeHead 200, { 'Content-Length': 0 }
    res.end()

