class ProductRelation < ApplicationRecord
  belongs_to :product, class_name: 'Product'
  belongs_to :related_to, class_name: 'Product', foreign_key: 'related_to_id', inverse_of: :products # rubocop:disable Rails/RedundantForeignKey Rails/InverseOf
end
