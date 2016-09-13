$(document).on('turbolinks:load', function() {
  ga('send', 'pageview');
});

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

$(document).on('click', '.js-hamburger', function() {
  $(document.body).toggleClass('hamburgerOpen');
})
