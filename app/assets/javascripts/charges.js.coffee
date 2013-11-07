# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#stripe-button").click ->
  token = (res) ->
    $input = $("<input type=hidden name=stripeToken />").val(res.id)
    $("form").append($input).submit()

  StripeCheckout.open
    key: $(this).attr("data-key")
    address: true
    amount: $(this).attr("data-amount")
    currency: $(this).attr("data-currency")
    name: "Please pay the amount set by your organizer to finalize your RSVP"
    description: $(this).attr("data-description")
    panelLabel: "Pay" + $(this).attr("data-amount")
    token: token

  false