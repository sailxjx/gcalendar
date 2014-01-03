gc = require('./private/gc')

gc.api('events.get')
  calendarId: 'sailxjx@gmail.com'
  eventId: 'r72agi6kvbvtt7nao9gfpubj4k'
, (err, event) ->
  return console.log err if err?
  console.log event
