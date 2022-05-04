class CartItem < ApplicationRecord
  include ActionView::RecordIdentifier

  has_many :cart_item_option_values, dependent: :destroy

  belongs_to :cart
  belongs_to :product

  after_create_commit do
    broadcast_replace_to cart,
                         target: 'cart_count',
                         partial: 'carts/item_count',
                         locals: { count: cart.quantity }

    broadcast_append_to cart,
                        target: 'cart_item',
                        partial: 'carts/item_line',
                        locals: { cart_item: self }

    broadcast_replace_to product,
                         target: 'cart_form',
                         partial: 'products/form',
                         locals: { current_cart: cart, product: product }
  end

  after_update_commit do
    broadcast_replace_to cart,
                         target: 'cart_count',
                         partial: 'carts/item_count',
                         locals: { count: cart.quantity }

    broadcast_replace_to cart,
                         target: dom_id(self),
                         partial: 'carts/item_line',
                         locals: { cart_item: self }

    broadcast_replace_to cart,
                         target: 'total_price',
                         partial: 'carts/total_price',
                         locals: { current_cart: cart }
  end

  after_destroy_commit do
    broadcast_remove_to cart
    broadcast_replace_to cart,
                         target: 'cart_count',
                         partial: 'carts/item_count',
                         locals: { count: cart.quantity }
    broadcast_replace_to cart,
                         target: 'total_price',
                         partial: 'carts/total_price',
                         locals: { current_cart: cart }
  end

   accepts_nested_attributes_for :cart_item_option_values

  def total_price
    quantity.to_i * product.price.to_f
  end

  def total_price_secondat
    (cart_item_option_values.map(&:price).sum) * quantity.to_i
    # quantity.to_i
  end
end
