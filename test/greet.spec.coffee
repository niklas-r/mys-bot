expect = require('chai').expect
sinon = require('sinon')
Helper = require('hubot-test-helper')
interpolate = require('interpolate')
greetings = require('../static/greetings')
greetHelper = new Helper('../scripts/greet.coffee')

describe '"välkomna" command', ->
  beforeEach ->
    @room = greetHelper.createRoom(httpd: false)

  afterEach ->
    @clock.restore()

  [
    { moment: 'morning', date: new Date(2016, 3, 5, 4, 0 ,0) },
    { moment: 'morning', date: new Date(2016, 3, 5, 10, 59 ,0) },
    { moment: 'day', date: new Date(2016, 3, 5, 11, 0 ,0) },
    { moment: 'day', date: new Date(2016, 3, 5, 17, 59 ,0) },
    { moment: 'evening', date: new Date(2016, 3, 5, 18, 0 ,0) },
    { moment: 'evening', date: new Date(2016, 3, 5, 0, 0 ,0) }
    { moment: 'evening', date: new Date(2016, 3, 5, 3, 59 ,0) }
  ].forEach((test) ->
    it "should greet a user in the #{test.moment} at #{test.date.toString()}",
      (done) ->
        @clock = sinon.useFakeTimers(test.date.getTime())
        interpolatedGreetings = greetings[test.moment].map (greeting) ->
          interpolate(greeting, {user: '@kalle'})

        @room.user.say('pelle', '@hubot välkomna @kalle').then =>
          expect(interpolatedGreetings).to.include(@room.messages[1][1])
          done()
  )
