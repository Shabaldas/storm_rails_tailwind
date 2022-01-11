class ProductCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :products, inverse_of: :category, foreign_key: 'category', dependent: :destroy

  has_ancestry

  scope :select_tree, ->(id) { where.not(id: id).arrange }

  validates :name, presence: true

  private

  def should_generate_new_friendly_id?
    slug.blank?
  end
end
