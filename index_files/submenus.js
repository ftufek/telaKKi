telaKKi.views.submenus = {};

//
// Submenu for showing options (filters) to the user
//
telaKKi.views.submenus.options = (function(){
  var _dropdown_content;
  function _initLanguageOption() {
    
  };

  return {
    init : function(id) {
      var id = id || 'action-options';
      var btn = $('#'+id);
      _dropdown_content = btn.parent('div').find('ul');
      _dropdown_content.on('click',function(e){
        e.stopPropagation(); //should not close the dropdown if the click is inside it
      });

      _initLanguageOption();
    }
  };
})();

$(document).ready(function(){
  telaKKi.views.submenus.options.init();
});
