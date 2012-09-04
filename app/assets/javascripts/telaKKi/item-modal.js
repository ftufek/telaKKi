telaKKi.itemModal = (function(){
  var _info = {
    title: "",
    link: ""
  };

  function _showModalWithInfo(){
    for(key in _info){
      if(key == "link"){
        $('#item-modal .'+key).attr("href",_info[key]);
      }else{
        $('#item-modal .'+key).text(_info[key]);
      }
    }

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
