express = require "express"
path = require "path"
favicon = require "static-favicon"
logger = require "morgan"
cookieParser = require "cookie-parser"
bodyParser = require "body-parser"
routes = require "./routes/index"
users = require "./routes/users"
app = do express
exphbs  = require 'express3-handlebars'
mongoose = require 'mongoose'

# Socket 
http = require 'http'
server = http.createServer app
io = require('socket.io') server

io.on 'connection', () ->
  console.log "oui"

# view engine setup
app.set "views", path.join __dirname, "views"

app.engine "handlebars", exphbs defaultLayout: "index"
app.set "view engine", "handlebars"

app.use do favicon
app.use logger "dev"
app.use do bodyParser.json
app.use do bodyParser.urlencoded
app.use do cookieParser
app.use require("node-compass") mode: "expanded"
app.use "/", routes
app.use "/users", users

#/ Static files
# app.use () ->
#     console.log @req, res

app.use express.static path.join __dirname, "public"
# app.use '/views', express.static path.join __dirname + '/views'

#/ catch 404 and forward to error handler
app.use (req, res, next) ->
  console.log "why 404"
  err = new Error "Not Found"
  err.status = 404
  next err
  return


#/ error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
      message: err.message
      error: err
    return


# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  console.log "ici la 500"
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}
  return

# Connect to the database
do require './config/schemas'

module.exports = app
