express = require 'express'
http = require 'http'
path = require 'path'

app = module.exports = express()

app.configure ->
  app.set 'port', process.env.PORT or 4000
  app.use express.logger('dev')
  app.use express.compress()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, 'www'))

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

app.listen app.get('port')
console.log("Express server on port #{app.get('port')}");