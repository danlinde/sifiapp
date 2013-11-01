var deadline = $('#timer').data('ends-at');

$('#timer').countdown({until: new Date(deadline)});

$(".time-select").windowed({
  animate: true
});

$(document).ready(function(){
	$("#email_input").inputosaurus({
		inputDelimiters : [",",";"," "],
		width: "30%",
		parseOnBlur: true
	});
});

$('.datetimepicker').datetimepicker({
	dateFormat: 'dd-mm-yy'
});