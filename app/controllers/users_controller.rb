class UsersController < ApplicationController

  def new
    @is_using_email = true
    @user = User.new
  end

  def create
    @is_using_email = (params[:user] and !params[:user][:email].nil?)

    @user = User.new(params.require(:user)
      .permit(:email, :password, :password_confirmation, :cellphone, :token))
    @user.uuid = RandomCode.generate_utoken
    update_browser_uuid @user.uuid

    if @user.save
      flash[:notice] = "注册成功，请登录"
      redirect_to new_session_path
    else
      render action: :new
    end
  end

end
