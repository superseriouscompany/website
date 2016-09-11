$(document).on('turbolinks:load', function() {
  ga('send', 'pageview');
});


$(document).on('click', '.js-hamburger', function() {
  $(document.body).toggleClass('hamburgerOpen');
})
