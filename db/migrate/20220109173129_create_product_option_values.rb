class CreateProductOptionValues < ActiveRecord::Migration[6.1]
  def change
    create_table :product_option_values do |t|
      t.references :product_option, null: false, foreign_key: { on_delete: :cascade }
      t.references :option_value, null: false, foreign_key: { on_delete: :cascade }
      
      t.timestamps
    end
  end
end
