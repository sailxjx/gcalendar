gc = require('./private/gc')

event =
  email: 'sailxjx@gmail.com'
  start: '2013-12-07T12:00:00'
  end: '2013-12-07T12:00:00'
  method: 'email'
  minutes: 15

gc.api('events.insert')
  calendarId: 'sailxjx@gmail.com'
, event
, (err, event) ->
  return console.log err if err?
  console.log event
