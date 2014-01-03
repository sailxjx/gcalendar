gc = require('./private/gc')

gc.api('events.list')
  calendarId: 'sailxjx@gmail.com'
, (err, result) ->
  return console.log err if err? or not result?.items?
  {items} = result
  for i, item of items
    console.log item
