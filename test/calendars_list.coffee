gc = require('./private/gc')

gc.api('calendars.get')
  calendarId: 'sailxjx@gmail.com'
, (err, result) ->
  return console.log err if err?
  console.log result
