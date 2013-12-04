gc = require('./private/gc')

gc.api('events.get').arguments(
  calendarId: 'sailxjx@gmail.com'
  eventId: 'r72agi6kvbvtt7nao9gfpubj4k'
).execute (err, event) ->
  return console.log err if err?
  console.log event
