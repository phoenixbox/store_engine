class Cart < ActiveRecord::Base
  belongs_to :user
  attr_accessible :data
end
