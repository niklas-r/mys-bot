# Description:
#   Make Ernst motivate a fellow user or youself
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ernst motivera <användare> - Ernst försöker motivera <användare>
#   ernst motivera mig - Ernst försöker motivera dig
interpolate = require('interpolate')
motivations = require('../static/motivations')

module.exports = (robot) ->
  robot.respond /motivera mig/i, (msg) ->
    user = "@#{msg.message.user.name}"
    motivation = msg.random motivations
    interpolatadeMotivation = interpolate(motivation, user: user)
    msg.send interpolatadeMotivation

  robot.respond /motivera ((?!mig)(?:@?\S+))/i, (msg) ->
    user = msg.match[1]
    motivation = msg.random motivations
    interpolatadeMotivation = interpolate(motivation, user: user)
    msg.send interpolatadeMotivation
