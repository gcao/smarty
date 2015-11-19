# Commands:
#   hubot cc OR code cov OR code coverage - Deploy onboarding to devloco on port number.
#

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /(cc|code cov|code coverage)/i, (msg) ->
    ccReportUrl = 'http://10.111.14.226:8080/job/vbs-onboarding-unit-specs/Unit_Coverage_Report/index.html'
    ccReportUrlLastBuild = 'http://10.111.14.226:8080/job/vbs-onboarding-unit-specs/lastBuild/Unit_Coverage_Report/index.html'
    ccReportBranchUrl = 'http://10.111.14.226:8080/job/vbs-onboarding-unit-specs-1.0/Unit_Coverage_Report/index.html'
    ccReportBranchUrlLastBuild = 'http://10.111.14.226:8080/job/vbs-onboarding-unit-specs-1.0/lastBuild/Unit_Coverage_Report/index.html'
    #ccReportUrl = 'http://10.111.14.226:8080/job/vbs-onboarding-client-specs-trunk/Unit_Coverage_Report/index.html'
    #ccReportUrlLastBuild = 'http://10.111.14.226:8080/job/vbs-onboarding-client-specs-trunk/lastBuild/Unit_Coverage_Report/index.html'

    robot.http(ccReportUrl).get() (err, res, body) ->
      if err
        msg.send "Sorry, I can't seem to find it right now!"
        return

      $ = cheerio.load(body)

      val = parseFloat($('.pad1y span').first().text())
      #val = parseFloat($('.metric').first().text())
      admonishment = switch
        when val < 70 then "You should all be ashamed. (codecoverage)"
        when val < 80 then "Come on... you can do better!"
        when val < 90 then "Good.. but not good enough... for Tom to dance on table..."
        when val >= 90 then "That's what I'm talking about!"

      msg.send "Master Code coverage for LAST SUCCESSFUL BUILD is #{val}%. #{admonishment}"

    robot.http(ccReportUrlLastBuild).get() (err, res, body) ->
      if err
        msg.send "Sorry, I can't seem to find it right now!"
        return

      $ = cheerio.load(body)

      val = parseFloat($('.pad1y span').first().text())
      #val = parseFloat($('.metric').first().text())
      admonishment = switch
        when val < 70 then "You should all be ashamed. (codecoverage)"
        when val < 80 then "Come on... you can do better!"
        when val < 90 then "Good.. but not good enough... for Tom to dance on table..."
        when val >= 90 then "That's what I'm talking about!"

      msg.send "Master Code coverage for LAST BUILD (good or bad) is #{val}%. #{admonishment}"

    robot.http(ccReportBranchUrl).get() (err, res, body) ->
      if err
        msg.send "Sorry, I can't seem to find it right now!"
        return

      $ = cheerio.load(body)

      val = parseFloat($('.pad1y span').first().text())
      #val = parseFloat($('.metric').first().text())
      admonishment = switch
        when val < 70 then "You should all be ashamed. (codecoverage)"
        when val < 80 then "Come on... you can do better!"
        when val < 90 then "Good.. but not good enough... for Tom to dance on table..."
        when val >= 90 then "That's what I'm talking about!"

      msg.send "Branch Code coverage for LAST SUCCESSFUL BUILD is #{val}%. #{admonishment}"

    robot.http(ccReportBranchUrlLastBuild).get() (err, res, body) ->
      if err
        msg.send "Sorry, I can't seem to find it right now!"
        return

      $ = cheerio.load(body)

      val = parseFloat($('.pad1y span').first().text())
      #val = parseFloat($('.metric').first().text())
      admonishment = switch
        when val < 70 then "You should all be ashamed. (codecoverage)"
        when val < 80 then "Come on... you can do better!"
        when val < 90 then "Good.. but not good enough... for Tom to dance on table..."
        when val >= 90 then "That's what I'm talking about!"

      msg.send "Branch Code coverage for LAST BUILD (good or bad) is #{val}%. #{admonishment}"
