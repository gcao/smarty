# Description:
#   hubot die - tell the bot to kill itself
#

module.exports = (robot) ->

  robot.respond /die/i, (msg) ->
    # This message is not sent ?!
    msg.send "Good bye, cruel world!"
    # ps aux | grep -v grep | grep hipchat_startup | awk -p '{$2}' | xargs kill
    process.exit 0

