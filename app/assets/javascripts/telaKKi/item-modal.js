telaKKi.itemModal = (function(){
  var _info = {
    title: "",
    description: "",
    link: ""
  };

  function _showModalWithInfo(){
    $('#item-modal').html(HandlebarsTemplates['item-modal'](_info));
    $('#item-modal').modal();
  }

  function _constructInfoFromItem(el){
    for(key in _info){
      _info[key] = el.data(key); 
    }
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
