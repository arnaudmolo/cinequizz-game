describe 'Rooms', ->

  it 'should create a room instance', (done) ->
    theRoom = new Room 'aventure'
    theRoom.should.ne.an.instanceOf Room

  it 'should count the number of rooms created', (done) ->

    while i <= 5
      i++
      new Room ''

    Room.countAll().then (res) ->
      res.should.beEqual 5
