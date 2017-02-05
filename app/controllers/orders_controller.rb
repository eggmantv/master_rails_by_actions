class OrdersController < ApplicationController

  before_action :auth_user

  def new
    fetch_home_data
  end

  def create

  end

end
