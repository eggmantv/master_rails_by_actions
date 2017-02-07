class OrdersController < ApplicationController

  before_action :auth_user

  def new
    fetch_home_data
    @shopping_carts = ShoppingCart.by_user_uuid(current_user.uuid)
      .order("id desc").includes([:product => [:main_product_image]])
  end

  def create
    shopping_carts = ShoppingCart.by_user_uuid(current_user.uuid).includes(:product)
    if shopping_carts.blank?
      redirect_to shopping_carts_path
      return
    end

    address = current_user.addresses.find(params[:address_id])
    orders = Order.create_order_from_shopping_carts!(current_user, address, shopping_carts)

    redirect_to generate_pay_payments_path(order_nos: orders.map(&:order_no).join(','))
  end

end
