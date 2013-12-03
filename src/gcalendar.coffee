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

  client: (callback = ->) ->
    gapi.discover('calendar', 'v3').execute(callback)

  execute: (req, callback = ->) ->
    req.withAuthClient(@auth).execute(callback)

  generateAuthUrl: ->
    return @auth.generateAuthUrl
      access_type: 'offline'
      scope: 'https://www.googleapis.com/auth/calendar'
      approval_prompt: 'force'

  getToken: (code, callback = ->) ->
    @auth.getToken(code, callback)

module.exports = Gcalendar
