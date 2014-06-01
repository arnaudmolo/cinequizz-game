mongoose = require 'mongoose'

mongooseModel = mongoose.model 'Room'

class Room extends mongooseModel
  constructor: (categorie) ->
    mongooseModel.findOne
      categorie: categorie
    .exec (err, res) =>
      unless res
        super
          categorie: categorie
        console.log @
        @save () ->
          console.log 'saved !'

module.exports = Room
