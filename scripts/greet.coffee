# Description:
#   Make Ernst say hello to a user
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   ernst välkomna <användare> - Ernst välkomnar <användare>
interpolate = require('interpolate')
greetings = require('../static/greetings')
module.exports = (robot) ->
  robot.respond /välkomna (.*)$/i, (res) ->
    user = res.match[1]
    hours = new Date().getHours()
    if hours >= 0 and hours < 4 or hours >= 18 and hours <= 23
      time = 'evening'
    else if hours >= 4 and hours < 11
      time = 'morning'
    else
      time = 'day'
    res.send interpolate(res.random(greetings[time]), user: user)
