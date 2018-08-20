class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_index_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


  private
  def user_params
    params.require(:user).permit(:username, :birth, :password, :email, :id)
  end
end
