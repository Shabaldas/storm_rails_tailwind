module Carts
  class CartItemsController < ApplicationController

    def create
      @cart_item = current_cart.cart_items.build(cart_item_params)

      @cart_item.save
    end

    private

    def cart_item_params
      params.require(:cart_item)
            .permit(:product_id, cart_item_option_values_attributes: %i[id product_option_value_id])
            .merge(quantity: 1)
    end
 end
end