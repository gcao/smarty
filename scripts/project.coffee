# Commands:
#   hubot create project
#

Conversation = require 'hubot-conversation'
Project = require '../lib/project.coffee'

module.exports = (robot) ->
  conversation = new Conversation(robot)

  robot.respond /create project/i, (msg)->
    dialog = conversation.startDialog(msg)
    msg.send "Sure, let's get started. What is the name of the project?"
    dialog.addChoice /(?:[^:]*: )?(.*)/, (msg2) ->
      name = msg2.match[1]
      project = new Project(name: name)
      project.save()
      msg.send "A project has been created with name \"#{name}\"."

