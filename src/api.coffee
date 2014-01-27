crypto = require('crypto')
Gcalendar = require('./gcalendar')
logger = require('graceful-logger')

instances = {}

clearInstance = ->
  for k, instance of instances
    delete instances[k] if new Date - instance.started > 300000 
  return true

loadInstance = (instanceId, callback) ->
  if Math.round(Math.random() * 200) is 100  # 1/200
    clearInstance()
  unless instances[instanceId]
    logger.warn("error NOINSTANCE: #{instanceId}")
    return callback(new Error('NOINSTANCE'))
  callback(null, instances[instanceId])

exports.init = (options, callback = ->) ->
  instanceId = crypto.createHash('sha1').update(JSON.stringify(options)).digest('hex')
  logger.info("instance id: #{instanceId}")
  gc = new Gcalendar(options)
  gc.started = new Date
  instances[instanceId] = gc
  callback(null, instanceId)

exports.api = (instanceId, query, args...) ->
  logger.info("call api: #{instanceId}")
  loadInstance instanceId, (err, instance) ->
    return callback(err) if err?
    instance.api(query).apply(instance, args)

exports.generateAuthUrl = (instanceId, callback = ->) ->
  logger.info("call generateAuthUrl: #{instanceId}")
  loadInstance instanceId, (err, instance) ->
    return callback(err) if err?
    callback(null, instance.generateAuthUrl())

# Register other methods
['getToken', 'refreshToken'].forEach (method) ->
  exports[method] = (instanceId, args...) ->
    logger.info("call #{method}: #{instanceId}")
    loadInstance instanceId, (err, instance) ->
      instance[method].apply(instance, args)
