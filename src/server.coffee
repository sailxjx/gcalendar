axon = require('axon')
rpc = require('axon-rpc')
api = require('api')

server = ->
  rep = axon.socket('rep')
  server = new rpc.Server(rep)
  rep.bind(4133)
  server.expose(api)

module.exports = server
