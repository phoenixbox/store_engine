require 'spec_helper'

describe Order do
  it "must have a user_id" do
    order = Order.new
    expect(order).to_not be_valid
  end
  let!(:user){User.create(email: "admin@admin.com", username: "admin", password: "admin", password_confirmation: "admin", admin:true)}
  let!(:product){Product.create!(
    title: "Nalgene Water Bottle", 
    long_description:"a really strong water bottle", 
    price:12345, 
    cost_cents:6780, 
    visible:true)}

  describe '.for_user' do
    it "creates an order" do
      cart = user.create_cart
      cart.data = {1 => 1}
      order = Order.for_user(user)
      expect(order).to be_kind_of(Order)
    end

    it "creates an order with the same line items as itself" do
      cart = user.create_cart
      user.cart.data = {1 => 3}
      order = Order.for_user(user)
      expect(order.line_items.size).to eq 1
    end

    it "creates an order attached to the cart's user" do
      cart = user.create_cart
      order = Order.for_user(user)
      expect(order.user_id).to eq cart.user_id
    end
  end

  describe '#add_product' do
    xit "takes a product_id and quantity" do
      Product.stub(:find).and_return(FakeProduct.new)
      order = Order.new
      expect(order.line_items.size).to eq 0
      order.add_product(1, 1)
      expect(order.line_items.size).to eq 1
    end
  end
end
