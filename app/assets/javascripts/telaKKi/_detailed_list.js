$(window).resize(function() {
  if(!isMobile()){
    var h = $('.item .img').outerHeight();
    $('.item .main_info').height(h);
    $('.item .extra_info').height(h);
  }else{
    $('.item .main_info').css('height','');
    $('.item .extra_info').css('height','');
  }
});
