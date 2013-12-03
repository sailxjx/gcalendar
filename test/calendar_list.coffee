Gcalendar = require('../lib')

gc = new Gcalendar
  client_id: '292059093839.apps.googleusercontent.com'
  client_secret: 'seYdzdQESiJe8I_Tk-RwknwZ'
  redirect_uri: 'http://www.tb.com/open/google'
  access_token: 'ya29.1.AADtN_XAhCFkYTbxgz0AYlco-BhgQ9-dStyFx0F5yN3ZnfOi0aDkMHSvmOD31DU',
  refresh_token: '1/SweueLhhbHfg3TuOrGdUUU9xosifPw6HwVOxtQu82Ck'
  token_type: 'Bearer',

gc.client (err, client) ->
  req = client.calendar.calendarList.list()
  gc.execute req, (err, result) ->
    console.log result

  req1 = client.calendar.calendars.get({calendarId: 'sailxjx@gmail.com'})
  gc.execute req1, (err, result) ->
    console.log result

  req2 = client.calendar.events.list({calendarId: 'sailxjx@gmail.com'})
  gc.execute req2, (err, result) ->
    console.log result
