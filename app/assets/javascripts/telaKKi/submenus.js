telaKKi.views.submenus = {};

//
// Submenu for showing options (filters) to the user
//
telaKKi.views.submenus.options = (function(){
  return {
    bind_to : function(id) {
      var btn = $('#'+id);
      btn.click(function() {
        _submenu_id = btn.data('target') || "options-submenu";
        $('#'+_submenu_id).slideToggle(100);
      });
    }
  };
})();
