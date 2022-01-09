class Option < ApplicationRecord
  has_many :option_values, dependent: :destroy
  has_many :product_options, dependent: :destroy

  accepts_nested_attributes_for :option_values, allow_destroy: true

  enum option_type: { radio_buttons: 0, select_boxes: 1, check_boxes: 2 }
  enum measurement: { mm: 0, sm: 1, m: 2, color: 3 }

  validates :title, :slug, :option_type, :measurement, presence: true
end
