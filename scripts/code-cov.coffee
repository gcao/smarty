# Commands:
#   hubot cc OR code cov OR code coverage - Deploy onboarding to devloco on port number.
#

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /(cc|code cov|code coverage)/i, (msg) ->
    ccReportUrl = 'http://10.111.14.226:8080/job/vbs-onboarding-client-specs-trunk/JS_Coverage_Report/index.html'

    robot.http(ccReportUrl).get() (err, res, body) ->
      if err
        msg.send "Sorry, I can't seem to find it right now!"
        return

      $ = cheerio.load(body)

      val = parseFloat($('.metric').first().text())
      admonishment = switch
        when val < 70 then "You should all be ashamed. (codecoverage)"
        when val < 80 then "Come on... you can do better!"
        when val < 90 then "Good.. but not good enough."
        when val >= 90 then "That's what I'm talking about!"
      msg.send "#{val}%  #{admonishment}"
