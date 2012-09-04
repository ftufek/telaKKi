$(function() {
  update_user_items_list();

  $('.delete_item').bind('ajax:success', function() {
    var el = $(this).closest('.element');
    el.addClass('to_remove');
    el.slideUp(200);
    setTimeout("remove_unnecessary_html()",200);
  });
});

function update_user_items_list() {
  var n = $('.user_item_list .item').size();

  if(n >= 1){
    $('#no_sale').slideUp();
    $('#no_message').slideUp();
  }else{
    $('#no_sale').slideDown();
    $('#no_message').slideDown();
  }
}

function remove_unnecessary_html() {
  $('.to_remove').remove();
  update_user_items_list();
}
