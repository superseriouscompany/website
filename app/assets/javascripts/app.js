(function() {
  // Hook google analytics into turbolinks properly
  $(document).on('turbolinks:load', function() {
    ga('send', 'pageview');

    if( supportsDesktopNotifications() && (!window.localStorage || !window.localStorage.getItem('subscribed')) ) {
      $(document).find('.js-notifications').show();
    }
  });

  // Ideas form submission
  $(document).on('submit', '.js-submission-form', function() {
    var form = $(this);
    var $body = form.find('.js-body');
    var $thinker = form.find('.js-thinker');

    if( !$body.val() ) {
      return false;
    }

    if( $body.is(':visible') ) {
      $body.hide();
      $thinker.show().focus();
      return false;
    }
  })
  $(document).on('keyup', '.js-detect-filled', function() {
    var input = $(this);
    input.parents('form').toggleClass('submittable', !!input.val());
  })

  // Hamburger menu behavior
  $(document).on('click', '.js-hamburger', function() {
    $(document.body).toggleClass('hamburgerOpen');
  })

  // Desktop notifications
  $(document).on('click', '.js-subscribe', subscribe);

  if( isDev() ) { subscribe() }

  // TODO: break this up and clean it up
  function subscribe() {
    if( !supportsDesktopNotifications() ) { return; }
    navigator.serviceWorker.register('/serviceWorker.js').then(function() {
      return navigator.serviceWorker.ready;
    }).then(function(reg) {
      reg.pushManager.subscribe({
        userVisibleOnly: true
      }).then(function(sub) {
        if( !sub.endpoint ) { return console.error("Endpoint not provided", sub); }
        var subscriptionId = sub.endpoint.split('/').slice(-1)[0];
        return fetch('/subscriptions', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({fcm_id: subscriptionId})
        }).then(function(res) {
          if( res.status > 299 ) { return console.error("Received unexpected status", res.status); }
          console.log("Subscribed", subscriptionId);
          window.localStorage && window.localStorage.setItem('subscribed', 1);
          $(document).find('.js-notifications').html("Thanks!");
        }).catch(function(err) {
          console.error("Error adding subscription", err);
        })
      }).catch(function(err) {
        console.error("Push subscription error :(", err);
      });
    }).catch(function(err) {
      console.error("Service worker error :(", err)
    })
  }

  function supportsDesktopNotifications() {
    return 'serviceWorker' in navigator
  }

  function isDev() {
    return window.location.search && window.location.search.match(/dev=.+/);
  }
})()
