class Item < ActiveRecord::Base
  scope :order_by_latest_items, order("created_at DESC")

  belongs_to :user
  has_one :category
  has_many :images, as: :imageable
  has_many :messages, dependent: :destroy
  has_many :statistics
  accepts_nested_attributes_for :images, reject_if: lambda { |t| t['image'].nil? }
  acts_as_gmappable address: "address", normalized_address: "address",
                    msg: "Sorry, not even Google could figure out where that is!"

  attr_accessible :address, :description, :down_votes, :price, :title, :up_votes, :views
  attr_accessible :user_id
  attr_accessible :category_id
  attr_accessible :images
  attr_accessible :images_attributes
  attr_accessor :email

  validates :title, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 } 
  validates :up_votes, allow_nil: true, numericality: { only_integer: true }
  validates :down_votes, allow_nil: true, numericality: { only_integer: true }
  validates :address, presence: true #FINISH THE VALIDATION FOR CONTAINS POSTAL_CODE

  extend FriendlyId
  friendly_id :title, use: :slugged

  searchable do
    text :title, :description, :address
    integer :price
  end

  def self.new_from(details)
    if details[:email].to_s.strip.length == 0
      details[:id] = current_user.id
      return Item.new(details)
    else
      # implement
    end
  end

  def self.new_with_images(details, images)
    item = Item.new(details)
    #Image.update_images_for_item(item.id, images) unless images.nil?
    return item
  end

  def likes
    return statistics.where(type:"like").count
  end

  def dislikes
    return statistics.where(type:"dislike").count
  end

  private
  def geocode?
#    !(address.blank? || (!latitude.blank? && !longitude.blank?))
    true
  end
end
