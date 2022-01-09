class OptionValue < ApplicationRecord
  has_many :product_option_values, dependent: :destroy
  belongs_to :option

  delegate :title, :measurement, :slug, :option_type, to: :option

  scope :order_by_title, -> { order('option_id') }
  scope :group_by_slug, ->(slug) { join(:option).where(option: { slug: slug }) }

  validates :value, presence: true
end
