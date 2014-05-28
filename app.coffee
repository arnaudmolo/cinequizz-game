express = require("express")
path = require("path")
favicon = require("static-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
routes = require("./routes/index")
users = require("./routes/users")
app = express()
exphbs  = require('express3-handlebars')

# view engine setup
app.set "views", path.join __dirname, "views"

app.engine "html", exphbs defaultLayout: "index"
app.set "view engine", "html"

app.use do favicon
app.use logger "dev"
app.use do bodyParser.json
app.use do bodyParser.urlencoded
app.use do cookieParser
app.use require("node-compass") mode: "expanded"
app.use express.static path.join __dirname, "public"
app.use "/", routes
app.use "/users", users

#/ catch 404 and forward to error handler
app.use (req, res, next) ->
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
  res.status err.status or 500
  res.render "error",
    message: err.message
    error: {}

  return

module.exports = app
