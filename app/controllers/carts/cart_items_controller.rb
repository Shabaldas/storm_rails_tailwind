module Carts
  class CartItemsController < ApplicationController
    def update_quantity
      @cart_item = current_cart.cart_items.find_by(id: params[:id])

      if params[:operation] == '+'
        @cart_item.quantity += 1
      else
        @cart_item.quantity = [@cart_item.quantity - 1, 1].max
      end
      @cart_item.save
    end

    def destroy
      @cart_item = current_cart.cart_items.find_by(id: params[:id])

      if @cart_item.cartable.is_a?(Product)
        @cart_item.destroy
      else
        print_model = @cart_item.cartable.print_model
        if print_model.print_model_attributes.one?
          print_model.destroy
        else
          @cart_item.cartable.destroy
        end
      end
    end
  end
end
