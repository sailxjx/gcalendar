gc = require('./private/gc')

gc.client (err, client) ->
  req1 = client.calendar.calendars.get({calendarId: 'sailxjx@gmail.com'})
  gc.execute req1, (err, result) ->
    console.log result
