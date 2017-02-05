class Address < ApplicationRecord

  validates :user_id, presence: true
  validates :address_type, presence: true
  validates :contact_name, presence: { message: "收货人不能为空" }
  validates :cellphone, presence: { message: "手机号不能为空" }
  validates :address, presence: { message: "地址不能为空" }

  belongs_to :user

  attr_accessor :set_as_default

  after_save :set_as_default_address
  before_destroy :remove_self_as_default_address

  module AddressType
    User = 'user'
    Order = 'order'
  end

  private
  def set_as_default_address
    if self.set_as_default.to_i == 1
      self.user.default_address = self
      self.user.save!
    else
      remove_self_as_default_address
    end
  end

  def remove_self_as_default_address
    if self.user.default_address == self
      self.user.default_address = nil
      self.user.save!
    end
  end


end
