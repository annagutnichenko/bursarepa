class User < ActiveRecord::Base
  validates :email, presence: true
  has_secure_password

  has_many :petitions

  attr_accessible :email, :password

  validates_uniqueness_of :email
end
