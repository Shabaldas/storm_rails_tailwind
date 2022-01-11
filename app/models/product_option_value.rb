class ProductOptionValue < ApplicationRecord
  belongs_to :product_option
  belongs_to :option_value

  delegate :product, to: :product_option
  delegate :title, :measurement, :value, to: :option_value

  scope :with_less_price, lambda {
    joins(:product_option).where(product_options: { primary: true }).order(price: :asc).first
  }

  validates :option_value_id, uniqueness: { scope: :product_option_id }
  validate :validate_price_presence

  private

  def validate_price_presence
    return unless product_option.primary && price.zero?

    errors.add(:price, 'Ціна є обовязковою для primary option')
  end
end
