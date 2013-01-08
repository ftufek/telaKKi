telaKKi.views.custom_components = (function() {
  return {

  }
})();

telaKKi.views.custom_components.dropdown = (function(){
  // Customizes the dropdown that comes with bootstrap css
  // To use custom dropdown, add data-toggle="custom-dropdown" instead of data-toggle="dropdown" to the <a href></a>
  var _dropdown_container;
  var _visible = false;

  function _hideDropdown() {
    _dropdown_container.removeClass('open');
    _visible = false;
  };

  function _showDropdown() {
    _dropdown_container.addClass('open');
    _visible = true;
  };

  function _action() {
    if(_visible) { _hideDropdown(); }
    else { _showDropdown(); }
  };
  return {
    init : function() {
      var toggle = $('[data-toggle="custom-dropdown"]');
      toggle.click(function(){
        _action();
      });
      _dropdown_container = toggle.parent('div');
    }
  }
})();

$(document).ready(function(){
        $('#social-like').popover({placement:'top'});
});
