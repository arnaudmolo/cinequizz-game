Room = require './../models/room.coffee'

module.exports = 
  class RoomsController
    @rooms: {}
    constructor: () ->

    @createRooms: (list_of_rooms) ->
      for room_name in list_of_rooms
        @rooms[room_name] = new Room room_name
