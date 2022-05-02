class Product < ApplicationRecord
  extend FriendlyId

  has_many :product_options, dependent: :destroy
  has_many :options, through: :product_options
  has_many :product_option_values, through: :product_options, dependent: :destroy
  has_many :option_values, through: :product_option_values
  has_many :product_relations, dependent: :destroy
  has_many :related_products, through: :product_relations, source: :related_to
  has_many :images, class_name: 'ProductImage', dependent: :destroy

  has_one :primary_product_option, ->(_where) { where primary: true }, class_name: 'ProductOption', dependent: :destroy # rubocop:disable  Rails/InverseOf
  has_one :size_product_option, ->(_where) { where primary: false }, class_name: 'ProductOption', dependent: :destroy # rubocop:disable  Rails/InverseOf
  has_one :primary_option, through: :primary_product_option, class_name: 'Option', source: :option

  has_one_attached :main_picture
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :category, class_name: 'ProductCategory'

  enum product_type: { option_price: 0, own_price: 1 }
  enum status: { inactive: 0, active: 1 }

  friendly_id :name, use: :slugged

  validates :name, :description, presence: true
  validate :validate_own_price_presence

  accepts_nested_attributes_for :product_options, allow_destroy: true

  def default_price
    return product_option_values.with_less_price&.price if option_price? && product_option_values.with_less_price.present?

    price
  end

  def product_colors
    product_option_values.joins(:product_option).where(product_options: { id: primary_product_option.id })
  end

  def size_and_price
    product_option_values.joins(:product_option).where(product_options: { id: size_product_option.id }).map do |option|
      [
        option.value,
        option.price
      ]
    end
  end

  private

  def should_generate_new_friendly_id?
    name_changed?
  end

  def validate_own_price_presence
    return unless own_price?

    errors.add(:price, 'Для цього типу продуктів ціна є обовязковою') if price.blank? || price.zero?
  end
end
