gc = require('./private/gc')

gc.api('events.list').arguments(
  calendarId: 'sailxjx@gmail.com'
).execute (err, event) ->
  return console.log err if err? or not result?.items?
  console.log result
  {items} = result
  for i, item of items
    console.log item
