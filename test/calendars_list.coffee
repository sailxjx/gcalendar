gc = require('./private/gc')

gc.api('calendars.get').arguments({
  calendarId: 'sailxjx@gmail.com'
}).execute (err, result) ->
  return console.log err if err?
  console.log result
