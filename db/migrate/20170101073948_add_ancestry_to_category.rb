class AddAncestryToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :ancestry, :string

    add_index :categories, [:ancestry]
  end
end
