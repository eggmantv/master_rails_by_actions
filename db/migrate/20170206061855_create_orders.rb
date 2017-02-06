class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id, :product_id, :address_id
      t.string :order_no
      t.integer :amount
      t.decimal :total_money, precision: 10, scale: 2
      t.datetime :payment_at
      t.timestamps
    end

    add_index :orders, [:user_id]
    add_index :orders, [:order_no], unique: true
  end
end
