class AddressesController < ApplicationController

  layout false
  before_action :auth_user
  before_action :find_address, only: [:edit, :update, :destroy, :set_default_address]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.new
  end

  def create
    @address = current_user.addresses.new(address_params)
    if @address.save
      @addresses = current_user.reload.addresses
      render json: {
        status: 'ok',
        data: render_to_string(file: 'addresses/index')
      }
    else
      render json: {
        status: 'error',
        data: render_to_string(file: 'addresses/new')
      }
    end
  end

  def edit
    render action: :new
  end

  def update
    @address.attributes = address_params
    if @address.save
      @addresses = current_user.reload.addresses
      render json: {
        status: 'ok',
        data: render_to_string(file: 'addresses/index')
      }
    else
      render json: {
        status: 'error',
        data: render_to_string(file: 'addresses/new')
      }
    end
  end

  def destroy
    @address.destroy

    @addresses = current_user.addresses
    render json: {
      status: 'ok',
      data: render_to_string(file: 'addresses/index')
    }
  end

  def set_default_address
    @address.set_as_default = 1
    @address.save

    @addresses = current_user.reload.addresses
    render json: {
      status: 'ok',
      data: render_to_string(file: 'addresses/index')
    }
  end

  private
  def address_params
    params.require(:address).permit(:contact_name, :cellphone, :address,
      :zipcode, :set_as_default)
  end

  def find_address
    @address = current_user.addresses.find(params[:id])
  end

end
