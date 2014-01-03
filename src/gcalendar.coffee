gapi = require('googleapis')
{OAuth2Client} = gapi

class Gcalendar

  constructor: (@options = {}) ->
    {client_id, client_secret, redirect_uri, access_token, refresh_token} = @options
    @auth = new OAuth2Client(client_id, client_secret, redirect_uri)
    if access_token? and refresh_token?
      @auth.credentials =
        access_token: access_token
        refresh_token: refresh_token

  execute: (request, callback = ->) ->
    try
      request.withAuthClient(@auth).execute(callback)
    catch e
      callback(e)

  api: (query) ->

    _api = (args...) =>
      if typeof args[args.length - 1] is 'function'
        callback = args.splice(args.length - 1)[0]
      else
        callback = ->
      @getClient (err, client) =>
        return callback(err) if err?

        _method = {}

        steps = query.split('.')
        steps.unshift('calendar')

        steps.every (prop) ->
          return _method = _method[prop] or client[prop]

        return callback(new Error("No Such Api! #{query}")) unless typeof _method is 'function'

        @execute _method.apply(client, args), (err, result) ->
          err = new Error(err) if err?
          callback(err, result)

    return _api

  getClient: (callback = ->) ->
    return callback(null, @_client) if @_client?
    gapi.discover('calendar', 'v3').execute (err, client) =>
      @_client = client
      callback(err, client)

  getAuth: -> @auth

  generateAuthUrl: (callback = ->) ->
    url = @auth.generateAuthUrl
      access_type: 'offline'
      scope: 'https://www.googleapis.com/auth/calendar'
      approval_prompt: 'force'
    callback(null, url)
    return url

  getToken: (code, callback = ->) ->
    @auth.getToken code, (err, result) ->
      err = new Error(err) if err?
      callback(err, result)

  refreshToken: (callback = ->) ->
    @auth.refreshAccessToken (err, result) ->
      err = new Error(err) if err?
      callback(err, result)

module.exports = Gcalendar
