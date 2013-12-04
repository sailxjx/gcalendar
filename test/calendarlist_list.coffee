gc = require('./private/gc')

gc.api('calendarList.list').execute (err, result) ->
  console.log result
