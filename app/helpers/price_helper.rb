module PriceHelper
  def total_price_second(currnet_cart)
    array = []
    currnet_cart.cart_items.each do |cart_item|
      array << cart_item.cart_item_option_values.sum(&:price) * cart_item.quantity # rubocop/disable Lint/AmbiguousOperatorPrecedence
    end
    array.sum
  end
end
