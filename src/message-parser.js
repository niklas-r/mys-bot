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
      // TODO: add more logging, user etc
      // TODO: message-parser should handle all parsing
      if (quotes.askedForQuote(message)) {
        console.log('Asked for quote')
        switch (message.getChannelType()) {
          case 'DM':
            slack.dms[message.channel].send(quotes.getQuote())
            console.log('Sending quote to DM channel')
            break
          case 'Channel':
            slack.channels[message.channel].send(quotes.getQuote())
            console.log('Sending quote to Channel channel')
            break
          case 'Group':
            slack.groups[message.channel].send(quotes.getQuote())
            console.log('Sending quote to Group channel')
            break
          default:
            console.log('Unknown channel type, cannot send quote. Channel type: ' + message.getChannelType())
        }
      }
      /* else if () {} */ // More stuff
    }
  }
}
