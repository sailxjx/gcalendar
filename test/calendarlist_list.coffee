gc = require('./private/gc')

gc.api('calendarList.list')(
  (err, result) ->
    console.log result
)
