# Description:
#   Hacky way to load environment variables when running outside
#   of Heroku (in development)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
require('dotenv').load() unless process.env.NODE_ENV == 'production'

module.exports = (robot) ->

