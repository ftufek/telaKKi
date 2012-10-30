class SVG
  @@config = {}

  def self.add(key,value = {})
    @@config[key] = value
  end

  def self.addd(key, width, height, whiteicon = false)
    whiteicon = false if whiteicon.nil?
    self.add(key, {width: width, height: height, whiteicon: whiteicon})
  end

  def self.add_array(array)
    array.each do |a|
      self.addd(a[0],a[1],a[2],a[3])
    end
  end  

  def self.config
    @@config
  end
end


SVG.add_array([
  ['sliders',-1,20],
  ['sale',-1,20],
  ['stats-message', -1, 30],
  ['message',-1,20],
  ['new-message',-1,20],
  ['upload-photo', -1, 35],
  ['likeus',-1,30],
  ['iteminfo',-1,20],
  ['unreadmessage',-1,19]
])
