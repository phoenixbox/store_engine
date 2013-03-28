module CartsHelper

  def subtotal(shopping_cart)
    result = shopping_cart.collect do |product, count|
      product.price.to_f * count
    end.inject(:+)
    "%.2f" % (result / 100.00)
  end
end
