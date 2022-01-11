class CreateProductRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :product_relations do |t|
      t.references :product, null: false, foreign_key: { on_delete: :cascade }
      t.references :related_to, null: false, foreign_key: { on_delete: :cascade, to_table: :products }

      t.timestamps
    end
  end
end
