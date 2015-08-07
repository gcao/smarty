module.exports = (robot) ->
  ports =
    444: 'vbs-ob-deploy-dloco'
    8100: 'vbs-ob-deploy-dloco-m1'
    8110: 'vbs-ob-deploy-dloco-m2'
    8120: 'vbs-ob-deploy-dloco-m3'

  robot.respond /deploy (ob|onboarding) ?(\d+)?/i, (msg)->
    port = msg.match[2] || 444
    job = ports[port]

    url = "http://10.111.14.226:8080/job/#{job}/build"

    msg.http(url).post('') (err, res, body) ->
      if err
        msg.send "Oops.. something went wrong: http://10.111.14.226:8080/job/#{job}/"
        return

      msg.send "Deploying Onboarding on port #{port}"


  robot.router.post '/hubot/build-ob-done/:port', (req, res) ->
    port = req.params.port

    robot.messageRoom '', "Onboarding successfully deployed: https://vbs-purchase-fe-vm-01.dloco.s.vonagenetworks.net:#{port}"

    res.send 'OK'
