class Cart < ActiveRecord::Base
  store :data
  belongs_to :user
  attr_accessible :data
end
