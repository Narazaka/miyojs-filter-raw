chai = require 'chai'
chai.should()
expect = chai.expect
sinon = require 'sinon'
Miyo = require 'miyojs'
MiyoFilters = require '../raw.js'

describe 'raw', ->
	ms = null
	request = null
	id = null
	stash = null
	beforeEach ->
		ms = new Miyo()
		for name, filter of MiyoFilters
			ms.filters[name] = filter
		sinon.spy ms, 'call_entry'
		request = ->
		id = 'OnTest'
		stash = null
	it 'should return raw value', ->
		entry =
			filters: ['raw']
			argument:
				raw:
					a: 'dummy'
		return_argument = ms.call_filters entry, request, id, stash
		return_argument.should.deep.equal a: 'dummy'
	it 'should throw with no argument.raw', ->
		entry =
			filters: ['raw']
		(-> ms.call_filters entry, request, id, stash).should.throw /argument\.raw undefined/
		entry =
			filters: ['raw']
			argument:
				other: 'a'
		(-> ms.call_filters entry, request, id, stash).should.throw /argument\.raw undefined/
