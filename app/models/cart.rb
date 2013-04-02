class Cart < ActiveRecord::Base
  store :data
  belongs_to :user
  attr_accessible :data


  # def self.decrease(id,count)
  #   session[:shopping_cart][id] -= count
  # end

  # def self.increase(id,count)
  #   binding.pry
  #   session[:shopping_cart][id] += count
  # end

  # def self.remove(id)
  #   session[:shopping_cart][id] = 0
  # end

end
