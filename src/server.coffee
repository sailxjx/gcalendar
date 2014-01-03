axon = require('axon')
rpc = require('axon-rpc')
api = require('./api')

server = ->
  rep = axon.socket('rep')
  server = new rpc.Server(rep)
  rep.bind(5187)
  server.expose(api)
  console.log 'gcalendar serving'

module.exports = server
