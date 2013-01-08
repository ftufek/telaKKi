$(document).ready(function() {
  $('#categories_container').imagesLoaded(function(){
          $('#categories_container').masonry({
            itemSelector: '.category',
            columnWidth: 340,
            isFitWidth: true
          });
  });
});
