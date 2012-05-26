class Ad < ActiveRecord::Base
  attr_accessible :address, :description, :down_votes, :price, :title, :up_votes

  validates :title, presence: true, uniqueness: true, length: { in: 5..50 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 } 
  validates :up_votes, allow_nil: true, numericality: { only_integer: true }
  validates :down_votes, allow_nil: true, numericality: { only_integer: true }
  validates :address, presence: true #FINISH THE VALIDATION FOR CONTAINS POSTAL_CODE
end
