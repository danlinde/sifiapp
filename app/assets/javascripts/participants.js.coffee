# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

dispatcher = new WebSocketRails 'localhost:3000/websocket'
channel = dispatcher.subscribe 'responses'
channel.bind 'new', (participant) ->
	$('[data-id=' + participant.id + ']').text(participant.response)

