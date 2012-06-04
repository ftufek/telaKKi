class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :image
  belongs_to :imageable, polymorphic: true
  has_attached_file :image,
      { url: "/system/:hash.:extension", 
        hash_secret: "3c804a381a!ds12dcqw3sfASD",
        styles: { medium: "560x320", thumb: "160x120#" } }
      
end
