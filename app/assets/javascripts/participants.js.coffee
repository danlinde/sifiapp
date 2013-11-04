# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


dispatcher = new WebSocketRails 'localhost:3000/websocket'
channel = dispatcher.subscribe 'responses'
channel.bind 'new', (participant) ->
	# next line can be used to update response if using text
	# $('[data-id=' + participant.id + ']').text(participant.response)
	# next line can be used to update response if ordering responses
	$('#response').load document.URL+' #response';
	notify("Set & Forget", "New RSVP to your event", "token")
