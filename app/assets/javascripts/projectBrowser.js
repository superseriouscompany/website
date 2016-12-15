(function() {
  $(document).on('click', '.js-toggle-lightbox', function() {
    var ret = $(document.body).toggleClass('lightbox-open');

  })

  $(document).on('click', '.js-next-project-update', function() {
    $('.js-stage').html($('#update-0').html());
    console.log("next");
  })

  $(document).on('click', '.js-prev-project-update', function() {
    $('.js-stage').html($('#update-1').html());
    console.log("previous");
  })
})()
