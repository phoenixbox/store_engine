class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :addresses
  has_many :orders
  has_one  :cart
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password

  def to_s
    username
  end

end
