gc = require('./private/gc')

gc.client (err, client) ->
  return console.log err if err?
  req = client.calendar.calendarList.list()
  gc.execute req, (err, result) ->
    console.log result
