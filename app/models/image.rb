class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :image,
      { url: "/system/:hash.:extension", 
        hash_secret: "3c804a381a!ds12dcqw3sfASD",
        styles: { medium: "560x320", thumb: "160x120#" } }

  # attr_accessible :title, :body
  attr_accessible :image

  validates_attachment :image, presence: true,
    content_type: { 
      content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
      message: 'file type is not allowed (only jpeg/png/gif images)' },
    size: { in: 0..5.megabytes }
end
