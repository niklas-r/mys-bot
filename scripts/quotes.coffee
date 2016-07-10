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
#   citat, visdomsord, väl valda ord - Ernst delar med sig av ett insiktsfullt citat
QUOTES = require('../static/quotes')

module.exports = (robot) ->
  robot.hear /(citat|visdomsord|väl valda ord)/i, (res) ->
    res.send res.random QUOTES
