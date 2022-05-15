class Cart < ApplicationRecord
  has_secure_token
  has_many :cart_items, dependent: :destroy
  belongs_to :order, optional: true

  def quantity
    cart_items.sum(&:quantity)
  end
end
