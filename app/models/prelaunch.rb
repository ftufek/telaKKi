class Prelaunch < ActiveRecord::Base
  attr_accessible :email

  validates :email, uniqueness: true, presence: true, length: { minimum: 5 }
end
