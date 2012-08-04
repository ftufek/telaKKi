$(document).ready ->
  $('input[type="file"]').first().slideDown();

  $('#fileuploadd').fileupload({ 
    dataType: 'json'
    send: (e,data) ->
      $('.images').slideDown();
      $('
          <div id="" class="image">
            <div class="progress progress-striped active">
              <div class="bar" style="width: 0%"></div>
            </div>
          </div>
      ').appendTo('.images')

    done: (e, data) ->
      alert(data);
    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10);
      $(data.filename + ' .progress .bar').css('width',progress+'%');
      
  })

  $('#fileupload').fileupload({
    autoUpload:true, 
    url:'/images', 
    paramName:'image',
    formData: {imageable_type:'Item'}
  });
  $('input, textarea').placeholder();
