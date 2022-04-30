module Carts
  class AddsController < ApplicationController
    def create
      # ap '<<<<<<<'
      # ap params
      # ap params[:product][:id]
      # ap product_found?
      # ap '<<<<<<'
      return unless product_found?

      cart_item = current_cart.cart_items.find_or_initialize_by(product_id: params[:product][:id])
      cart_item.quantity += 1
      cart_item.save
    end

    private

    def product_found?
      ap '??????'
      # # ap params[:product].blank?
      ap params
      # # ap params[:product][:id].present?
      # # ap params
      ap '??????'
      # if params.dig(:product, :id)
        Product.exists?(params[:product][:id])
      # else
      #   Product.exists?(params[:product][:id])
      # end
    end
  end
end
