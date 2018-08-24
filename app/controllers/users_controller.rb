# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :admin_user,     only: :destroy

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def editpassword
    @user = current_user
  end

  def userprofile
    @user = User.find(id: params[:id])
  end

  def index; end

  def show
    @users = User.all.page(params[:page]).per(5)
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
    @users = User.find(params[:id])
    @users.destroy

    flash.notice = "User '#{@user.username}' was deleted"

    redirect_to root_path
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  private

  def user_params
    params.require(:user).permit(:username, :birth, :password, :email, :id)
  end
end
