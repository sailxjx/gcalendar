gc = require('./private/gc')

gc.client (err, client) ->
  req = client.calendar.calendarList.list()
  gc.execute req, (err, result) ->
    console.log result

  req2 = client.calendar.events.list({calendarId: 'sailxjx@gmail.com'})
  gc.execute req2, (err, result) ->
    console.log result
