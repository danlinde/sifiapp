var deadline = $('#timer').data('ends-at');

$('#timer').countdown({until: new Date(deadline)});

// $("input:checkbox").windowed({
//   animate: false
// });

// $("select").windowed({
//   animateDuration: 1000
// });

$(document).ready(function(){
	$("#email_input").inputosaurus();
});