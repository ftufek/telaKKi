isMobile = ->
  return true if $(window).width() <= 767
  return false

isTablet = ->
  return true if $(window).width() > 767 and $(window).width() < 980
  return false

window.App = {}
