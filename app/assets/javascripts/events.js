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

$(document).ready(function(){
//Hide the tooglebox when page load
$(".togglebox").hide();
//slide up and down when hover over heading 2
$(".hovering").hover(function(){
// slide toggle effect set to slow you can set it to fast too.
$(this).next(".togglebox").slideToggle("slow");
return true;
});
});
