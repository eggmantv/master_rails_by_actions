class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :user_id
      t.string :user_uuid
      t.integer :product_id
      t.integer :amount
      t.timestamps
    end

    add_index :shopping_carts, [:user_id]
    add_index :shopping_carts, [:user_uuid]
  end
end
