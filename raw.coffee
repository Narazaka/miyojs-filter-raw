### (C) 2014 Narazaka : Licensed under The MIT License - http://narazaka.net/license/MIT?2014 ###

unless MiyoFilters?
	MiyoFilters = {}

MiyoFilters.raw = type: 'data-value', filter: (argument, request, id, stash) ->
	unless argument?.raw?
		throw 'argument.raw undefined'
	argument.raw

if module? and module.exports?
	module.exports = MiyoFilters
