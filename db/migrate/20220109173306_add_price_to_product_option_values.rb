class AddPriceToProductOptionValues < ActiveRecord::Migration[6.1]
  def change
    add_column :product_option_values, :price, :decimal, precision: 8, scale: 2, default: 0.0, null: false

    add_index :product_option_values, %i[option_value_id product_option_id], unique: true, name: 'primary_option'
  end
end
