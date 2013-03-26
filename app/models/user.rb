class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
