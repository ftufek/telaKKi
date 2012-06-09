$(function() {
  $(window).resize();
  $('.carousel .item:first-child').addClass("active");
  $('.carousel').carousel('cycle');

  if($('.carousel-inner img').size() <= 1){
    $('.carousel-control').css("display","none");
  }

  arrange_forms();
});

$(window).resize(function() {
  if(!isMobile()){
    var h = $('.item .img').outerHeight();
    $('.item .main_info').height(h);
    $('.item .extra_info').height(h);

    arrange_forms();
  }else{
    $('.item .main_info').css('height','');
    $('.item .extra_info').css('height','');

    remove_arrange_forms();
  }
});

function arrange_forms() {
  $('.controls').addClass('row-fluid');
  $('.controls').children().addClass('span12');

  $('#item_category_id, #item_price').removeClass('span12').addClass('span6');
  $('#item_category_id').css('float','left');
  $('#item_price').css('float','right');
  var price = $('#item_price');
  $('#item_price').parent().parent().removeClass();
  $('#item_category_id').parent().append(price);
}

function remove_arrange_forms() {
  $('.controls').removeClass('row-fluid');
}
