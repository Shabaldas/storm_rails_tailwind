class AddFieldsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_type, :integer, default: 0
    add_column :products, :price, :decimal, precision: 8, scale: 2, default: 0.0, null: false
  end
end
