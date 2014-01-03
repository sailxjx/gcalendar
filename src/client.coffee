axon = require('axon')
rpc = require('axon-rpc')
req = axon.socket('req')

$client = null

class Client

  @connect: ->
    unless $client?
      req.connect.apply(req, arguments)
      $client = new rpc.Client(req)
    return this

  constructor: (options) ->
    $client.call 'init', options, (err, instance) ->
      @instance = instance

  api: (query) ->

    _api = {}
    _arguments = []

    $client.call(@instance, query, )

    _api.execute = (callback = ->) =>
      return _api

    _api.arguments = ->
      _arguments = arguments

    return _api

  execute: (request, callback) ->

  getAuth: ->

  generateAuthUrl: ->

  getToken: ->

  refreshToken: ->

module.exports = Client
