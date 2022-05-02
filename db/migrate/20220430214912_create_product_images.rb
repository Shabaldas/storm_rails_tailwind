class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images do |t|
      t.references :product, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
