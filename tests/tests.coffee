should = require 'should'
assert = require 'assert'
supertest = require 'supertest'
winston = require 'winston'
Room = require './models/room.coffee'

describe 'tests', () ->
  it 'should run the tests', () ->
    true.should.be.true
