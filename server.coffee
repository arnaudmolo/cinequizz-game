app = require './app'

app.listen 3000

application_controller = require './app/controllers/application_controller'
new application_controller api: 'http://onesime.fr/kouk/'
