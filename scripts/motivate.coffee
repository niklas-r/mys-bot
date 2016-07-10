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
#   ernst motivera mig - Ernst försöker dig
interpolate = require('interpolate')
motivations = require('../static/motivations')

module.exports = (robot) ->
  robot.hear /motivera (@?\S+)/, (msg) ->
    user = msg.match[1]
    motivation = msg.random motivations
    interpolatadeMotivation = interpolate(motivation, user: user)
    msg.send interpolatadeMotivation
