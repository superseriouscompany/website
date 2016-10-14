(function() {
  // Hook google analytics into turbolinks properly
  $(document).on('turbolinks:load', function() {
    ga('send', 'pageview');

    if( supportsDesktopNotifications() && (!window.localStorage || !window.localStorage.getItem('subscribed')) ) {
      $(document).find('.js-notifications').show();
    }

    $(document).find('.js-likable').each(function() {
      var $el = $(this);
      var currentPosition = $el.css('position');
      if( !currentPosition || currentPosition == 'static' ) { $el.css('position', 'relative'); }

      $('.js-heartTemplate').last().clone().removeClass('hide').appendTo($el);
    })
  });

  // Hamburger menu behavior
  $(document).on('click', '.js-hamburger', function() {
    $(document.body).toggleClass('hamburgerOpen');
  })

  // Desktop notifications
  $(document).on('click', '.js-subscribe', subscribe);

  // Floating likes
  $(document).on('click', '.js-summonHearts', function() {
    $(document.body).toggleClass('heartsShown');
  })

  $(document).on('click', '.js-heart', function() {
    var $el = $(this),
        $container = $el.closest('.js-likable');

    if( !$container[0] ){ return console.error("No .js-likable found"); }
    if( !$container.data('id') ) { return console.error("No id set"); }

    var image = $container.find('img')[0];
    var payload = {
      contentId: $container.data('id'),
      src: image && image.src,
      html: $container.html()
    }

    fetch('/likes', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify(payload)
    }).then(function(response) {
      if( response.status > 299 ) { throw new Error("Unexpected response " + response.status ); }
      $(this).closest('.heartHolder').addClass('active');
      setTimeout(function() {
        $('.js-summonHearts').click();
      }, 1000);
    }).catch(function(err) {
      return console.error(err);
    })
  })

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
