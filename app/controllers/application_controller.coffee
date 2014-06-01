Promise = require 'bluebird'
request = Promise.promisify require 'request'
RoomsController = require './rooms_controller'

module.exports = 
  class ApplicationController
    constructor: (config) ->
      request(config.api).spread (res, body) ->
        default_rooms = ['aventure', '90\'s', '80\'s', '70\'s', 'humour']
        RoomsController.createRooms default_rooms
