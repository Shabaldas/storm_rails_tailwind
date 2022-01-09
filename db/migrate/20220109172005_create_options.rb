class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :title
      t.string :slug
      t.integer :option_type
      t.integer :measurement

      t.timestamps
    end
  end
end
