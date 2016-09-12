$(document).on('turbolinks:load', function() {
  ga('send', 'pageview');
});

$(document).on('submit', '.js-submission-form', function() {
  var form = $(this);
  if( form.find('.js-body').is(':visible') ) {
    form.find('.js-body, .js-thinker').toggle();
    form.find('.js-thinker').focus();
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
