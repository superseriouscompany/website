(function() {
  var currentIndex = null;

  $(document).on('click', '.js-lightbox', function(e) {
    if( this != e.target ) { return; }
    $(document.body).removeClass('lightbox-open');
  })

  $(document).on('click', '.js-toggle-lightbox', function() {
    $(document.body).toggleClass('lightbox-open');
  })

  $(document).on('click', '.js-load-project-update', function() {
    var id = $(this).data('update-id');
    if( id === undefined ) { return console.error("No update id found on", this); }
    loadUpdate(id);
  })

  $(document).on('click', '.js-next-project-update', function() {
    loadUpdate(currentIndex+1);
  })

  $(document).on('click', '.js-prev-project-update', function() {
    loadUpdate(currentIndex-1);
  })

  function loadUpdate(id) {
    if( id < 0 ) { return; }
    var template = $('#update-'+id);
    if( !template.length ) { return; }

    $('.js-stage').html(template.html());
    $('.js-current-slide').text(id+1);
    currentIndex = id;
  }
})()
