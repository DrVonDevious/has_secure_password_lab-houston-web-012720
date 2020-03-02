class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong_params)
    if @user.password == @user.password_confirmation
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  def strong_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
