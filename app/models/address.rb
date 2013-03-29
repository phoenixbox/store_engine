class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address_line_1, :address_line_2, :city, :full_name, :phone_number, :state, :zipcode, :user
  validates :full_name,      :presence => true
  validates :address_line_1, :presence => true
  validates :city,           :presence => true
  validates :state,          :presence => true
  validates :state,          :length => { :maximum => 2, :too_long => "Max of 2 Characters"}
  validates :zipcode,        :presence => true
  validates :zipcode,        :length => {:minimum => 5, :too_short => "Minimum of 5 Characters"}
end
