# Description:
#   Beautiful pics of Ernst
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   selfie
SELFIES = require('../static/selfies')

module.exports = (robot) ->
  robot.hear /selfie/i, (res) ->
    res.send SELFIES[0] # Todo get more selfies!
