$(function() {
  $('.carousel .item:first-child').addClass("active");
  $('.carousel').carousel('cycle');

  if($('.item').size() <= 1){
    $('.carousel-control').css("display","none");
  }
});
