class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Successfully registered!"
      session[:user_id] = @user.id
      @cart = Cart.create(user_id: @user.id)
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User info updated successfully"
      redirect_to @user
    else
      render 'edit'
      flash[:error] = "user info was not updated"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "account successfully terminated"
    redirect_to products_path
  end

  private

  def check_user
    unless current_user == User.find(params[:id])
      flash[:danger] = "That is not your account"
      redirect_to '/'
    end
  end
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
