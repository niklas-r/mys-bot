'use strict'

const _ = require('lodash')
const QUOTE_COMMANDS = require('./commands').QUOTE_COMMANDS

const QUOTES = [
  'Idag ska vi smeka upp ett kök.',
  'Man kanske borde tälja på en pinne då och då för att må lite bättre.',
  'Det här är en fin liten morot som förtjänar respekt.',
  'Den här jorden är så fet att man nästan skulle vilja äta den eller ha den på en smörgås.',
  'Man känner sig aldrig så rik som när man plockar ut färskt bröd ur ugnen.',
  'Har det hänt någon gång att du nästan blivit förälskad i en sten?',
  'Färgen får det att brumma som en liten humla i mitt bröst',
  'Vad är det som gör att vissa granar faktiskt bestämmer sig för att bli julgranar och andra bara är fula?',
  'Jag har mött libbstickor som har tittat mig i ögonen',
  'Man måste se kuddarna som en orkester.',
  'Det här fönstret ger väldigt skön kontakt mellan ute och inne. Det är som att ute och inne vill varandra någonting.'
]

// Fancy generator shit to get new shuffled array each time
function * generateQuoteQueue () {
  let quotes = _.shuffle(QUOTES)
  for (let i in quotes) {
    yield quotes[i]
  }
}

let quoteQueue = generateQuoteQueue()

module.exports = {
  askedForQuote: (message) => {
    return QUOTE_COMMANDS.some(quoteCommand => { return _.includes(message.getBody(), quoteCommand) })
  },
  getQuote: () => {
    // Get next quote from queue
    let currentQuote = quoteQueue.next()

    // If quote queue is depleted
    if (currentQuote.done) {
      // Create new quote queue and get next quote immediately
      quoteQueue = generateQuoteQueue()
      currentQuote = quoteQueue.next()
    }

    // Return quote
    return currentQuote.value
  }
}
