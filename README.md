gcalendar
=========

Google Calendar SDK

## Example

### Generate Auth Url
```coffeescript
Gcalendar = require('gcalendar')

gcalendar = new Gcalendar
  client_id: 'xxxxxxxxxxxx.apps.googleusercontent.com'
  client_secret: 'xxxxxxxxxxxxxxxxx-yyyyyy'
  redirect_uri: 'http://you.redirect.url/google'

console.log gcalendar.generateAuthUrl()
```

### Get Token
```coffeescript
Gcalendar = require('gcalendar')

code = '4/X9GF6aiH7FbB6yyfOidNN48AQ-ng.gkT0lKE1kl0fXE-sT2ZLcbRPHy1khQI'  # important!

gcalendar = new Gcalendar
  client_id: 'xxxxxxxxxxxx.apps.googleusercontent.com'
  client_secret: 'xxxxxxxxxxxxxxxxx-yyyyyy'
  redirect_uri: 'http://you.redirect.url/google'

gcalendar.getToken code, (err, tokens) ->
  console.log tokens
```

### Call Apis
```coffeescript
Gcalendar = require('gcalendar')

gcalendar = new Gcalendar
  client_id: 'xxxxxxxxxxxx.apps.googleusercontent.com'
  client_secret: 'xxxxxxxxxxxxxxxxx-yyyyyy'
  redirect_uri: 'http://you.redirect.url/google'
  access_token: 'ya29.1.AADtN_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_yyyyy',
  refresh_token: '1/zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'

gcalendar.api('events.list').arguments(
  calendarId: 'sailxjx@gmail.com'
).execute (err, eventList) ->
  console.log eventList
```

## Google Api References
* [Api Console](https://code.google.com/apis/console/)
* [Calendar Api](https://developers.google.com/google-apps/calendar/v3/reference/)
* [Oauth2](https://developers.google.com/accounts/docs/OAuth2WebServer)
* [google-rfc-2445](http://google-rfc-2445.googlecode.com/svn/trunk/rfc2445.html)
