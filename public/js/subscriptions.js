$(function() {
  var handleStripeToken;
  handleStripeToken = function(token, args) {
    return $.ajax({
      type: 'PUT',
      url: '/profile/subscription',
      data: {
        subscription: {
          stripe_token: token.id,
          card_last4: token.card.last4
        }
      },
      success: function(data) {
        console.log(data);
        return window.location = "/profile";
      },
      error: function(err) {
        console.log(err);
      },
      dataType: "json"
    });
  };
  $('.subscribe-btn').click(function(e) {
    console.log("Here");
    var handler = StripeCheckout.configure({
      key: 'pk_test_oy58scwTIo43THRKjXc8aaHm',
      allowRememberMe: false,
      panelLabel: "Subscribe",
      token: handleStripeToken
    });
    handler.open({
      name: 'Simplifly Premium',
      description: 'Subscribe to Simplifly Premium',
      amount: 399
    });
    return false;
  });
  $('.auto-renew-button').click(function() {
    var will_cancel = $(this).text() === "Turn off auto renewal";
    return $.ajax({
      type: 'PUT',
      url: '/profile/subscription',
      data: {
        subscription: {
          will_cancel_at_period_end: will_cancel
        }
      },
      success: function(data) {
        return window.location = "/profile/subscription";
      },
      dataType: "json"
    });
  });
  return $('.delete-subscription').click(function(e) {
    return $.ajax({
      type: 'DELETE',
      url: '/profile/subscription',
      success: function(data) {
        return window.location = "/profile/subscription";
      },
      dataType: "json"
    });
  });
});
