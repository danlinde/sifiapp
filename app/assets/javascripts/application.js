// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.all
//= require inputosaurus
//= require jquery_ujs
//= require jquery.countdown
//= require jquery.windowed
//= require foundation
//= require jquery.flatshadow
//= require websocket_rails/main
//= require turbolinks
//= require_tree .

$(document).foundation();

function showflash() {
  var name = $("#notice").text();
  var flash = $("#notice");
  if (name.length > 1) {$(flash).addClass('flash').addClass('notice').html(name).appendTo('#flash-container')};
  setTimeout(function() {
    $(flash).fadeOut();
  }, 3000);
}

$(function() {
  showflash();
})

