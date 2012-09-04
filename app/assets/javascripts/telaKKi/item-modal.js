telaKKi.itemModal = (function(){
  var _info = {};

  function _showModalWithInfo(){
    $('#item-modal').html(HandlebarsTemplates['item-modal'](_info));
    $('#item-modal #images .item:first-child').addClass('active');
    if($('#item-modal .item').size() <= 1) { 
      $('#item-modal .carousel-control').hide();
    };
    $('#item-modal').modal();
  }

  function _constructInfoFromItem(el){
    _info = {};
    $.each(el.data(), function(k,v){
      _info[k]=v;
    });
  }

  return {
    show: function(el) {
      _constructInfoFromItem(el);
      _showModalWithInfo();
    }
  }
})();

$(document).ready(function(){
  $('.item-link').click(function(){telaKKi.itemModal.show($(this)); });
});
