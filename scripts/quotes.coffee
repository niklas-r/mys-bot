# Description:
#   Some famous Ernst quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ernst citat
#   ernst visdomsord
#   ernst quote
QUOTES = require('../static/quotes')

module.exports = (robot) ->
  robot.respond /(citat|visdomsord|quote)/i, (res) ->
    res.send res.random QUOTES
