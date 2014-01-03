gc = require('./private/gc')

gc.api('events.get')
  calendarId: 'sailxjx@gmail.com'
  eventId: 'm3uo0294k7q88ca2q1j90uscm4'
, (err, event) ->
  return console.log err if err?

  # date: 2013-12-12
  # dateTime: 2013-12-12T10:00:00Z
  # timeZone: 'UTC'

  event.start = { dateTime: new Date(Date.now() + 86400000), timeZone: 'UTC' }
  event.end = { dateTime: new Date(Date.now() + 86400000 * 2), timeZone: 'UTC' }

  gc.api('events.update').arguments(
    calendarId: 'sailxjx@gmail.com'
    eventId: 'm3uo0294k7q88ca2q1j90uscm4'
    , event
  ).execute (err, event) ->
    return console.log err if err?
    console.log event
