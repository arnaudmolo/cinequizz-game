Room = require './../models/room.coffee'
Promise = require 'bluebird'

module.exports = 
  class RoomsController
    constructor: () ->

    @createRooms: (list_of_rooms) ->
      console.log list_of_rooms
      
