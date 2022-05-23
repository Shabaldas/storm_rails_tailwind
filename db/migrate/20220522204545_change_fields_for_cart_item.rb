class ChangeFieldsForCartItem < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cart_items, :product
    add_reference :cart_items, :cartable, polymorphic: true
  end
end
