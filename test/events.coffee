gc = require('./private/gc')

gc.client (err, client) ->
  return console.log err if err?
  req = client.calendar.events.list({calendarId: 'sailxjx@gmail.com'})
  gc.execute req, (err, result) ->
    return console.log err if err? or not result?.items?
    {items} = result

    for i, item of items
      console.log item
