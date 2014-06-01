Room = require './../../app/models/room.coffee'

describe 'Rooms', ->

  it 'should create a room instance', () ->

    theRoom = new Room 'aventure'
    theRoom.should.be.an.instanceOf Room

  it 'should set the first argument as categorie property', () ->

    theRoom = new Room 'aventure'
    theRoom.should.be.an.instanceOf(Room).and.have.property 'categorie'
    theRoom.categorie.should.equal 'aventure'
