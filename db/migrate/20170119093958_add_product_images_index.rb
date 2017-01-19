class AddProductImagesIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :product_images, [:product_id, :weight]
  end
end
