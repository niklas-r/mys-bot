'use strict'

module.exports = {
  SLACK_API_TOKEN: process.env.SLACK_KEY, // Add a bot at https://my.slack.com/services/new/bot and copy the token here.
  AUTO_CONNECT: true, // Automatically reconnect after an error response from Slack.
  AUTO_MARK: true // Automatically mark each message as read after it is processed.
}
