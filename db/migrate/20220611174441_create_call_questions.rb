class CreateCallQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :call_questions do |t|
      t.string :phone_number
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
