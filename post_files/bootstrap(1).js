(function() {

  jQuery(function() {
    $("a[rel=popover]").popover({
      trigger: 'hover'
    });
    $("span[rel=popover]").popover({
      trigger: 'hover',
      placement: 'bottom'
    });
    $(".tooltip").tooltip();
    $("a[rel=tooltip]").tooltip();
    $("[rel=tooltip]").tooltip();
    return $("[rel=tooltip-bottom]").tooltip({
      placement: 'bottom'
    });
  });

}).call(this);
