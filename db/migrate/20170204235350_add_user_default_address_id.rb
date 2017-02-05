class AddUserDefaultAddressId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :default_address_id, :integer
  end
end
