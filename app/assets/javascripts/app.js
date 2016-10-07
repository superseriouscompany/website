(function() {
  // Hook google analytics into turbolinks properly
  $(document).on('turbolinks:load', function() {
    ga('send', 'pageview');
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

  function subscribe() {
    if( !('serviceWorker' in navigator) ) { return; }
    navigator.serviceWorker.register('/serviceWorker.js').then(function() {
      return navigator.serviceWorker.ready;
    }).then(function(reg) {
      reg.pushManager.subscribe({
        userVisibleOnly: true
      }).then(function(sub) {
        console.log(sub.endpoint);
      }).catch(function(err) {
        console.error("Push subscription error :(", err);
      });
    }).catch(function(err) {
      console.error("Service worker error :(", err)
    })
  }

  function isDev() {
    return window.location.search && window.location.search.match(/dev=.+/);
  }
})()
