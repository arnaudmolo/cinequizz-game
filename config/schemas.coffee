mongoose = require 'mongoose'

module.exports = () ->

  roomSchema = new mongoose.Schema categorie: String
  mongoose.model 'Room', roomSchema

  playerSchema = new mongoose.Schema
    username: String
    points: Number

  mongoose.model 'Player', playerSchema
  mongoose.connect 'mongodb://localhost/cinequizz-game'
