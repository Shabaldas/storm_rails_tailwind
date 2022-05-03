module BlaHelper
  def total_price_second(currnet_cart)
    x = []
    currnet_cart.cart_items.each do |cart_item|
     x<< (cart_item.cart_item_option_values.map(&:price).sum) * cart_item.quantity
    end
    x.sum
  end

  
end