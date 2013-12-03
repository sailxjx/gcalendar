gc = require('./private/gc')

gc.client (err, client) ->
  return console.log err if err?
  req = client.calendar.calendars.get({calendarId: 'sailxjx@gmail.com'})
  gc.execute req, (err, result) ->
    console.log result
