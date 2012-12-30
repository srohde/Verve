casper = require('casper').create
  verbose: true
  logLevel: "info"
  viewportSize:
    width: 320
    height: 480

# Accept Eula
casper.start "www/index.html", ->
  @debugHTML()

casper.then ->
  @captureSelector 'temp/app.png', '#app'

casper.run ->
  # display results
  @echo("done").exit()