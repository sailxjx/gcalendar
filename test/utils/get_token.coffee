Gcalendar = require('../../lib')

code = process.argv[2]

throw new Error('please give me the code') unless code?

gcalendar = new Gcalendar
  client_id: '292059093839.apps.googleusercontent.com'
  client_secret: 'seYdzdQESiJe8I_Tk-RwknwZ'
  redirect_uri: 'http://www.tb.com/open/google'

gcalendar.getToken code, (err, tokens) ->
  console.log arguments
