class ProductsController < ApplicationController

  before_action :fetch_home_data

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where("title like :title", title: "%#{params[:w]}%")
      .order("id desc").page(params[:page] || 1).per_page(params[:per_page] || 12)
      .includes(:main_product_image)

    unless params[:category_id].blank?
      @products = @products.where(category_id: params[:category_id])
    end

    render file: 'welcome/index'
  end

end
