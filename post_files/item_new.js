(function() {
  var resizeTextarea;

  resizeTextarea = function() {
    var $this, innerHeight, magic, outerHeight, scrollHeight;
    this.style.height = "";
    $this = $(this);
    outerHeight = $this.outerHeight();
    scrollHeight = this.scrollHeight;
    innerHeight = $this.innerHeight();
    magic = outerHeight - innerHeight;
    return this.style.height = scrollHeight + magic + "px";
  };

  $(document).ready(function() {
    $('#fileupload').fileupload({
      autoUpload: true,
      url: '/images',
      paramName: 'image',
      formData: {
        imageable_type: 'Item'
      }
    });
    $('input, textarea').placeholder();
    return $('textarea').keydown(resizeTextarea).keyup(resizeTextarea).change(resizeTextarea).focus(resizeTextarea);
  });

}).call(this);
