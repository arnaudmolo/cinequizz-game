should = require 'should'
assert = require 'assert'
supertest = require 'supertest'
winston = require 'winston'

describe 'tests', () ->
  it 'should run from other directories', () ->
    true.should.be.true
