module PriceHelper
  def total_price_second(currnet_cart)
    array = []
    currnet_cart.cart_items.each do |cart_item|
      if cart_item.cartable_type == 'PrintModelAttribute' # rubocop:disable Style/ConditionalAssignment
        array << (cart_item.cartable.subtotal_price * cart_item.quantity)
      else
        array << (cart_item.cart_item_option_values.sum(&:price) * cart_item.quantity)
      end
    end
    array.sum
  end
end
