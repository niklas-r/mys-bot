'use strict'

const http = require('http')
const slackConnection = require('./src/slack-connection')

slackConnection.init()

const PORT = process.env.PORT || 8000

function handleRequest (req, res) {
  res.end('It Works!')
}

const server = http.createServer(handleRequest)

server.listen(PORT, () => {
  console.log('Server listening on port %s', PORT)
})
