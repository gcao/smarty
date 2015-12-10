# Commands:
#   hubot Who are you?
#

os = require 'os'

module.exports = (robot) ->
  robot.respond /who are you/i, (msg)->
    cmds = renamedHelpCommands(robot)

    emit = "I am #{robot.name}, living at port #{process.env.EXPRESS_PORT} of #{os.hostname()}.\n"
    emit += "And here are several cool tricks I can do ;-)\n\n"
    emit += cmds.join "\n"
    msg.send emit

renamedHelpCommands = (robot) ->
  robot_name = robot.alias or robot.name
  help_commands = robot.helpCommands().map (command) ->
    command.replace /hubot/ig, robot_name
  help_commands.sort()

