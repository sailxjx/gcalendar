gc = require('./private/gc')

gc.api('events.list').arguments(
  calendarId: 'sailxjx@gmail.com'
).execute (err, result) ->
  return console.log err if err? or not result?.items?
  {items} = result
  for i, item of items
    console.log item
