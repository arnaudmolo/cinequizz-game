mongoose = require 'mongoose'

module.exports = () ->

  roomSchema = new mongoose.Schema categorie: String
  mongoose.model 'Room', roomSchema
  
  mongoose.connect 'mongodb://localhost/cinequizz-game'
