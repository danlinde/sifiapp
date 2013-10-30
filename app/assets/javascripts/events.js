var deadline = $('#timer').data('ends-at');

$('#timer').countdown({until: new Date(deadline)});
