class Tagging < ActiveRecord::Base
  belongs_to :category
  belongs_to :product
  # attr_accessible :title, :body
end
