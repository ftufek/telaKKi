class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :image,
      { url: "/system/:hash.:extension", 
        hash_secret: "3c804a381a!ds12dcqw3sfASD",
        styles: { medium: "560x320", thumb: "160x120#" } }

  # attr_accessible :title, :body
  attr_accessible :image, :imageable_id, :imageable_type

  validates_attachment :image, presence: true,
    content_type: { 
      content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
      message: 'file type is not allowed (only jpeg/png/gif images)' },
    size: { in: 0..5.megabytes }

  def thumbnail_url
    return self.image.url(:thumb)
  end

  def url
    return self.image.url(:medium)
  end

  def self.update_images_for_item(item, images)
    return if images.nil?
    images.each do |i|
      Image.update(i, imageable_id: item.id, imageable_type: "Item")
    end
  end

  def as_json(options)
    options = { methods: [:thumbnail_url, :url] }.merge(options)
    super(options) 
  end
end
