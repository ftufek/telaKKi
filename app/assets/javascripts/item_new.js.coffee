resizeTextarea = ->
  this.style.height = ""
  $this = $(this)
  outerHeight = $this.outerHeight()
  scrollHeight = this.scrollHeight
  innerHeight = $this.innerHeight()
  magic = outerHeight - innerHeight
  this.style.height = scrollHeight + magic + "px"

$(document).ready ->
  $('#fileupload').fileupload({
    autoUpload:true,
    url:'/images',
    paramName:'image',
    formData: {imageable_type:'Item'}
  })
  $('input, textarea').placeholder()
  $('textarea').keydown(resizeTextarea)
    .keyup(resizeTextarea)
    .change(resizeTextarea)
    .focus(resizeTextarea)
