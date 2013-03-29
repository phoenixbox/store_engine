class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  has_many :addresses
  has_many :orders
  has_one  :cart
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
  validates :display_name, :length => { :in => 2..32 }, :allow_blank => true

  validates :email, :uniqueness => true

  def to_s
    username
  end

end
