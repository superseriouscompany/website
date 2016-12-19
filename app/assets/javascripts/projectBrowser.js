(function() {
  var currentIndex = null;

  $(document).on('click', '.js-lightbox', function(e) {
    if( this != e.target ) { return; }
    closeLightbox();
  })

  $(document).on('keyup', function(e) {
    if( !lightboxIsOpen() ) { return; }

    // left arrow
    if( e.keyCode == 37 ) {
      loadUpdate(currentIndex-1);
    // right arrow
    } else if( e.keyCode == 39 ) {
      loadUpdate(currentIndex+1);
    // escape key
    } else if( e.keyCode == 27 ) {
      closeLightbox();
    }
  })

  $(document).on('click', '.js-toggle-lightbox', function() {
    if( lightboxIsOpen() ) {
      closeLightbox();
    } else {
      openLightbox();
    }
  })

  function lightboxIsOpen() {
    return $(document.body).hasClass('lightbox-open');
  }

  function closeLightbox() {
    $(document.body).removeClass('lightbox-open');
    setTimeout(function() {
      $('.js-lightbox').remove();
    }, 360);
  }

  function openLightbox() {
    var $div = $("<div class='js-lightbox'></div>").appendTo(".page-wrap");
    $div.html($('.js-lightbox-template').html());
    window.getComputedStyle($div[0]).opacity; // https://timtaubert.de/blog/2012/09/css-transitions-for-dynamically-created-dom-elements/
    $(document.body).addClass('lightbox-open');
  }

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

    $('.js-prev-project-update, .js-next-project-update').show();
    // Hide previous button if this is the first update
    if( id === 0 ) {
      $('.js-prev-project-update').hide();
    }
    // Hide next button if there is no next update
    if( !$('#update-'+(id+1)).length ) {
      $('.js-next-project-update').hide();
    }
  }
})()
