
class ProductOption < ApplicationRecord
  belongs_to :product
  belongs_to :option

  has_many :product_option_values, dependent: :destroy

  accepts_nested_attributes_for :product_option_values, allow_destroy: true

  delegate :title, :option_values, :slug, :option_type, to: :option
  validates :option_id, uniqueness: { scope: :product_id }
end
