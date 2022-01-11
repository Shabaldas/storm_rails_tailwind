class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: { on_delete: :cascade, to_table: :product_categories }
      t.integer :status, default: 0
      t.string :slug
      t.index :slug, unique: true


      t.timestamps
    end
  end
end
