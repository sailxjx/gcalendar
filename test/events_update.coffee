gc = require('./private/gc')

gc.api('events.get').arguments(
  calendarId: 'sailxjx@gmail.com'
  eventId: 'r72agi6kvbvtt7nao9gfpubj4k'
).execute (err, event) ->
  return console.log err if err?

  # date: 2013-12-12
  # dateTime: 2013-12-12T10:00:00Z
  # timeZone: 'UTC'

  event.start = { dateTime: new Date(), timeZone: 'UTC' }
  event.end = { dateTime: new Date(Date.now() + 86400000), timeZone: 'UTC' }

  gc.api('events.update').arguments(
    calendarId: 'sailxjx@gmail.com'
    eventId: 'r72agi6kvbvtt7nao9gfpubj4k'
    , event
  ).execute (err, event) ->
    return console.log err if err?
    console.log event
