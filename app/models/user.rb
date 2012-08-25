class User < ActiveRecord::Base
  acts_as_messageable

  has_many :items
  has_many :messages, foreign_key: :to_id
  has_many :likes
  has_one :setting
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [ :login ]

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  attr_accessor :login
  attr_accessible :login, :email

  validates :username, presence: true, uniqueness: true, length: { in: 5..14 }

  def name
    return self.username
  end

  def mailboxer_email(object)
    return self.email
  end

protected

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
