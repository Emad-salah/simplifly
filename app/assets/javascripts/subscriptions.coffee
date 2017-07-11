# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

handleStripeToken = (token, args) ->
  $.ajax
    type: 'PUT'
    url: '/profile/subscription'
    data:
      subscription: 
        stripe_token: token.id
        card_last4: token.card.last4
    success: (data) ->
      window.location = "/profile/subscription"
    dataType: "json"

handler = StripeCheckout.configure(
  key: 'pk_live_cM6Z2o5fituXYYWYQ5hNwcNh'
  allowRememberMe: false
  panelLabel: "Subscribe"
  token: handleStripeToken)

$('.subscription-btn').click (e) ->
  # Open Checkout with further options
  handler.open
    name: 'Simplifly Premium'
    description: 'Subscribe to Simplifly Premium'
    amount: 399
  return

$('.auto-renew-button').click () ->
  console.log($(this).text())
  will_cancel = $(@).text() == "Turn off auto renewal"
  $.ajax
    type: 'PUT'
    url: '/profile/subscription'
    data:
      subscription: 
        will_cancel_at_period_end: will_cancel
    success: (data) ->
      window.location = "/profile/subscription"
    dataType: "json"

$('.delete-subscription').click (e) ->
  $.ajax
    type: 'DELETE'
    url: '/profile/subscription'
    success: (data) ->
      window.location = "/profile/subscription"
    dataType: "json"