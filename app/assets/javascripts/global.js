$(function() {
});

function isMobile() {
  if($(window).width() <= 767){
    return true;
  }else{
    return false;
  }
}

function isTablet() {
  if($(window).width() > 767 && $(window).width() < 980){
    return true;
  }else{
    return false;
  }
}
