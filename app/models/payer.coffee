mongoose = require 'mongoose'

module.exports = 
  class Player extends mongoose.model 'Player'
    constructor: () ->
      super arguments
