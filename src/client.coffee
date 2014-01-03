axon = require('axon')
rpc = require('axon-rpc')
async = require('async')
req = axon.socket('req')

$client = null

class Client

  @connect: ->
    unless $client?
      req.connect.apply(req, arguments)
      $client = new rpc.Client(req)
    return Client

  constructor: (options) ->
    @start = new Date
    $client.call 'init', options, (err, instanceId) =>
      @instanceId = instanceId

  loadInstance: (callback = ->) ->
    return callback(null, @instanceId) if @instanceId?
    async.until(
      => @instanceId? or Date.now() - @start > 5000
      (next) -> setTimeout(next, 200)
      (err) =>
        return callback(new Error('NOINSTANCE')) unless @instanceId?
        callback(err, @instanceId)
    )

  api: (query) ->
    _api = (args...) =>

      if typeof args[args.length - 1] is 'function'
        callback = args[args.length - 1]
      else
        callback = ->

      @loadInstance (err, instanceId) ->
        return callback(err) if err?
        args = ['api', instanceId, query].concat(args)
        $client.call.apply($client, args)

    return _api

  generateAuthUrl: (callback = ->) ->
    @loadInstance (err, instanceId) ->
      return callback(err) if err?
      $client.call('generateAuthUrl', instanceId, callback)

  # Register other methods
  ['getToken', 'refreshToken'].forEach (method) ->
    Client.prototype[method] = (args...) ->

      if typeof args[args.length - 1] is 'function'
        callback = args[args.length - 1]
      else
        callback = ->

      @loadInstance (err, instanceId) ->
        return callback(err) if err?
        args = [method, instanceId].concat(args)
        $client.call.apply($client, args)

module.exports = Client
