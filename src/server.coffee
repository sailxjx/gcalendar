axon = require('axon')
rpc = require('axon-rpc')
logger = require('graceful-logger').format('color([:level :date]) :msg')
api = require('./api')

server = ->
  rep = axon.socket('rep')
  server = new rpc.Server(rep)
  rep.bind(5187)
  server.expose(api)
  logger.info('gcalendar serving')

module.exports = server
