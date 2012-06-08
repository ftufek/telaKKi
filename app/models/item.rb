class Item < ActiveRecord::Base
  attr_accessible :address, :description, :down_votes, :price, :title, :up_votes
  attr_accessible :user_id

  validates :title, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000 } 
  validates :up_votes, allow_nil: true, numericality: { only_integer: true }
  validates :down_votes, allow_nil: true, numericality: { only_integer: true }
  validates :address, presence: true #FINISH THE VALIDATION FOR CONTAINS POSTAL_CODE

  belongs_to :user
  has_one :category
  attr_accessible :category

  has_many :images, as: :imageable
  attr_accessible :images
  attr_accessible :images_attributes
  accepts_nested_attributes_for :images, reject_if: lambda { |t| t['image'].nil? }

  acts_as_gmappable address: "address", normalized_address: "address",
                    msg: "Sorry, not even Google could figure out where that is!"

private
  def geocode?
#    !(address.blank? || (!latitude.blank? && !longitude.blank?))
    true
  end
end
