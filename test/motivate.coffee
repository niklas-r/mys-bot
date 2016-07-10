expect = require('chai').expect
Helper = require('hubot-test-helper')
interpolate = require('interpolate')
motivations = require('../static/motivations')
motivateHelper = new Helper('../scripts/motivate.coffee')

describe '"motivera" command', ->
  beforeEach ->
    @room = motivateHelper.createRoom(httpd: false)

  it "should motivate other users", (done) ->
    interpolatedMotivation = motivations.map (motivation) ->
      interpolate(motivation, {user: '@kalle123'})

    @room.user.say('pelle', '@hubot motivera @kalle123').then =>
      expect(interpolatedMotivation).to.include(@room.messages[1][1])
      done()
