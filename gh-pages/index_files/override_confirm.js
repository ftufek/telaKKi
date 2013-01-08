(function() {

  $.rails.allowAction = function(element) {
    var $link, $modal_html, message, modal_html;
    message = element.data('confirm');
    if (!message) {
      return true;
    }
    $link = element.clone().removeAttr('class').removeAttr('data-confirm').addClass('btn').addClass('btn-danger').html("Yes, I'm positively certain.");
    modal_html = "<div class=\"modal\" id=\"myModal\">\n  <div class=\"modal-header\">\n    <a class=\"close\" data-dismiss=\"modal\">&#215;</a>\n    <h3>" + message + "</h3>\n  </div>\n  <div class=\"modal-body\">\n    <p>Be certain, sonny.</p>\n  </div>\n  <div class=\"modal-footer\">\n    <a data-dismiss=\"modal\" class=\"btn\">Cancel</a>\n  </div>\n</div>";
    $modal_html = $(modal_html);
    $modal_html.find('.modal-footer').append($link);
    $modal_html.modal();
    return false;
  };

}).call(this);
