class CartItem < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :cart
  belongs_to :cartable, polymorphic: true

  has_many :cart_item_option_values, dependent: :destroy

  accepts_nested_attributes_for :cart_item_option_values

  after_create_commit do # rubocop :disable  Metrics/BlockLength
    broadcast_replace_to cart,
                         target: 'cart_count',
                         partial: 'carts/item_count',
                         locals: { count: cart.quantity }

    broadcast_replace_to cart,
                         target: 'change_picture',
                         partial: 'carts/empty_basket',
                         locals: { current_cart: cart }

    broadcast_replace_to cart,
                         target: 'change_picture_in_co',
                         partial: 'carts/empty_co_basket',
                         locals: { current_cart: cart }

    broadcast_replace_to cart,
                        target: 'make_order', # rubocop :disable Layout/ArgumentAlignment
                        partial: 'carts/make_order',
                        locals: { current_cart: cart }

    broadcast_append_to cart,
                        target: 'cart_item',
                        partial: 'carts/item_line',
                        locals: { cart_item: self }
    if cartable.is_a?(Product)
      broadcast_replace_to cartable,
                           target: 'cart_form',
                           partial: 'products/form',
                           locals: { current_cart: cart, product: cartable }
    end

    # broadcast_replace_to product,
    #                      target: 'cart_form',
    #                      partial: 'products/form',
    #                      locals: { current_cart: cart, product: product }

    broadcast_replace_to cart,
                         target: 'total_price',
                         partial: 'carts/total_price',
                         locals: { current_cart: cart }
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
    if cartable.is_a?(Product)
      broadcast_replace_to cartable,
                           target: 'cart_form',
                           partial: 'products/form',
                           locals: { current_cart: cart, product: cartable }
    end
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

    broadcast_replace_to cart,
                         target: 'change_picture',
                         partial: 'carts/empty_basket',
                         locals: { current_cart: cart }

    broadcast_replace_to cart,
                         target: 'change_picture_in_co',
                         partial: 'carts/empty_co_basket',
                         locals: { current_cart: cart }

    broadcast_replace_to cart,
                         target: 'make_order',
                         partial: 'carts/make_order',
                         locals: { current_cart: cart }
  end

  def total_price
    quantity.to_i * product.price.to_f
  end

  def total_price_secondat
    cart_item_option_values.sum(&:price) * quantity.to_i
  end
end
