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
#   enrst <citat|visdomsord|väl valda ord> - Ernst delar med sig av ett insiktsfullt citat
QUOTES = require('../static/quotes')

module.exports = (robot) ->
  robot.respond /(citat|visdomsord|väl valda ord)/i, (res) ->
    res.send res.random QUOTES
