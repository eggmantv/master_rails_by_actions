class Order < ApplicationRecord

  validates :user_id, presence: true
  validates :product_id, presence: true
  validates :address_id, presence: true
  validates :total_money, presence: true
  validates :amount, presence: true
  validates :order_no, uniqueness: true

  belongs_to :user
  belongs_to :product
  belongs_to :address
  belongs_to :payment

  before_create :gen_order_no

  module OrderStatus
    Initial = 'initial'
    Paid = 'paid'
  end

  def is_paid?
    self.status == OrderStatus::Paid
  end

  def self.create_order_from_shopping_carts! user, address, *shopping_carts
    shopping_carts.flatten!
    address_attrs = address.attributes.except!("id", "created_at", "updated_at")

    orders = []
    transaction do
      order_address = user.addresses.create!(address_attrs.merge(
        "address_type" => Address::AddressType::Order
      ))

      shopping_carts.each do |shopping_cart|
        orders << user.orders.create!(
          product: shopping_cart.product,
          address: order_address,
          amount: shopping_cart.amount,
          total_money: shopping_cart.amount * shopping_cart.product.price
        )
      end

      shopping_carts.map(&:destroy!)
    end

    orders
  end

  private
  def gen_order_no
    self.order_no = RandomCode.generate_order_uuid
  end

end
