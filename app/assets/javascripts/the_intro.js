//= require jquery_ujs

$('#prelauncher_add').bind('ajax:before', function() {
  $('form').children().css({'display': 'none'});
  $('form img').css({'display': 'inline'});
});

$('#prelauncher_add').bind('ajax:success', function(event, data, status, xhr) {
  $('form').hide();

  if(data.status == "succeded") {
    $('#success').slideDown(200).delay(200);
    $('#general').slideDown(200);
  } else if(data.status == "already_registered") {
    $('#already_registered').slideDown(200).delay(200);
    $('#general').slideDown(200);
  } else {
    $('#failed').slideDown(200).delay(200);
  }
});
