$(document).on('turbolinks:load', function() {
  ga('send', 'pageview');
});

$(document).on('keyup', '.js-detect-filled', function() {
  var input = $(this);
  input.parents('form').toggleClass('submittable', !!input.val());
})

$(document).on('click', '.js-hamburger', function() {
  $(document.body).toggleClass('hamburgerOpen');
})
