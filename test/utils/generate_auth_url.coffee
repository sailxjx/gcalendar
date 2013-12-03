Gcalendar = require('../../lib')

gcalendar = new Gcalendar
  client_id: '292059093839.apps.googleusercontent.com'
  client_secret: 'seYdzdQESiJe8I_Tk-RwknwZ'
  redirect_uri: 'http://www.tb.com/open/google'

console.log gcalendar.generateAuthUrl()
