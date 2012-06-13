$(function() {
  $(window).resize();
  $('.carousel .item:first-child').addClass("active");
  $('.carousel').carousel('cycle');

  if($('.carousel-inner img').size() <= 1){
    $('.carousel-control').css("display","none");
  }

  arrange_item_form();
  update_user_items_list();

  $('.delete_item').bind('ajax:success', function() {
    var el = $(this).closest('.element');
    el.addClass('to_remove');
    el.slideUp(200);
    setTimeout("remove_unnecessary_html()",200);
  });

});

$(window).resize(function() {
  if(!isMobile()){
    var h = $('.item .img').outerHeight();
    $('.item .main_info').height(h);
    $('.item .extra_info').height(h);

    arrange_item_form();
  }else{
    $('.item .main_info').css('height','');
    $('.item .extra_info').css('height','');

    dearrange_item_form();
  }
});

function arrange_item_form() {
  $('.item-form .controls').addClass('row-fluid');
  $('.item-form .controls').children().addClass('span12');

  $('.item-form #item_category_id, .item-form #item_price').removeClass('span12').addClass('span6');
  $('.item-form #item_category_id').css('float','left');
  $('.item-form #item_price').css('float','right');
  var price = $('.item-form #item_price');
  $('.item-form #item_price').parent().parent().removeClass();
  $('.item-form #item_category_id').parent().append(price);
}

function dearrange_item_form() {
  $('.item-form .controls').removeClass('row-fluid');
}

function update_user_items_list() {
  var n = $('.user_item_list .item').size();

  if(n >= 1){
    $('#no_sale').slideUp();
  }else{
    $('#no_sale').slideDown();
  }
}

function remove_unnecessary_html() {
  $('.to_remove').remove();
  update_user_items_list();
}
