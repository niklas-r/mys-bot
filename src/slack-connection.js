'use strict'

const Slack = require('slack-client')
const config = require('./config')
const messageParser = require('./message-parser')

module.exports = {
  slack: null,
  init () {
    this.slack = new Slack(config.SLACK_API_TOKEN, config.AUTO_RECONNECT, config.AUTO_MARK)
    this.slack.on('open', () => {
      console.log(`Connected to ${this.slack.team.name} as @${this.slack.self.name}`)
    })

    this.slack.on('message', (message) => {
      messageParser.parseMessage(message, this.slack)
    })

    this.slack.on('error', (err) => {
      console.error('Error', err)
    })

    this.slack.login()
  }
}
