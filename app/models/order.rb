class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  attr_accessible :status, :subtotal
  validates_presence_of :user_id

  # def self.build_from_cart(cart)
  #   current_user.orders.create(status:"pending")

  #   cart.data.each do |product_id, quantity|
  #     order.add_product(product_id, quantity)
  #   end

  #   return order
  # end

  # def add_product(product_id, quantity)
  #   product = Product.find(product_id)
  #   line_items.build(
  #     :product_id       => product.id, 
  #     :quantity         => quantity, 
  #     :unit_price_cents => product.price)
  # end

  def self.for_user(user)
    order = user.orders.create(status: "pending")
    order.create_line_items(user.cart)
    order.calculate_subtotal
    order.save
    
    return order
  end

  def create_line_items(cart)
    cart.data.each do |id,quantity|
      product = Product.find(id)
      line_items.create(
        :product_id       => product.id,
        :quantity         => quantity, 
        :unit_price_cents => product.price)
    end
  end

  def calculate_subtotal
    result = []
    self.line_items.each do |line_item|
      result << line_item.quantity * line_item.unit_price_cents
    end
    self.subtotal = result.inject(:+)
  end

end
