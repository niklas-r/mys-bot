'use strict'

const _ = require('lodash')
const quotes = require('./quotes')

// Tests if bot is "at signed", ie "@botname"
function isAtSigned (message) {
  var re = new RegExp('^<@' + message._client.self.id + '>')
  return re.test(_.trim(message.getBody()))
}

module.exports = {
  parseMessage: (message, slack) => {
    if (isAtSigned(message)) {
      if (quotes.askedForQuote(message)) {
        switch (message.getChannelType()) {
          case 'DM':
            slack.dms[message.channel].send(quotes.getQuote())
            break
          case 'Channel':
            slack.channels[message.channel].send(quotes.getQuote())
            break
          default:
            console.log('Unknown channel type, cannot send quote.')
        }
      }
      /* else if () {} */ // More stuff
    }
  }
}
