crypto = require('crypto')
Gcalendar = require('./gcalendar')

instances = {}

clearInstance = ->

loadInstance = (instanceId, callback) ->
  if Math.round(Math.random() * 200) is 100  # 1/200
    clearInstance()
  return callback(new Error('NOINSTANCE')) unless instances[instanceId]
  callback(null, instances[instanceId])

exports.init = (options, callback = ->) ->
  instanceId = crypto.createHash('sha1').update(JSON.stringify(options)).digest('hex')
  gc = new Gcalendar(options)
  gc.started = new Date
  instances[instanceId] = gc
  callback(null, instanceId)

exports.api = (instanceId, query, args...) ->
  console.log 'call api'
  console.log args
  loadInstance instanceId, (err, instance) ->
    return callback(err) if err?
    # instance.api(query) args, (err, result) ->
    #   console.log arguments
    #   callback(err, result)
    instance.api(query).apply(instance, args)

exports.generateAuthUrl = (instanceId, callback = ->) ->
  loadInstance instanceId, (err, instance) ->
    return callback(err) if err?
    callback(null, instance.generateAuthUrl())

# Register other methods
['getToken', 'refreshToken'].forEach (method) ->
  exports[method] = (instanceId, args...) ->
    loadInstance instanceId, (err, instance) ->
      instance[method].apply(instance, args)
