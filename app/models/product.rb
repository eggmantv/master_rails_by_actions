class Product < ApplicationRecord

  belongs_to :category

  before_create :set_default_attrs


  private
  def set_default_attrs
    self.uuid = RandomCode.generate_product_uuid
  end
end
