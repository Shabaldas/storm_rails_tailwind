class AddAncestryToProductCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :product_categories, :ancestry, :string
    add_index :product_categories, :ancestry
  end
end
