class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_signup_params

    if @user.save
      log_in @user
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_update_info_params
      flash[:success] = t ".update_info_done"
      redirect_to @user
    else
      flash.now[:danger] = t ".error"
      render :edit
    end
  end

  private

  def user_signup_params
    params.require(:user).permit :full_name, :user_name, :password,
      :password_confirmation
  end

  def user_update_info_params
    params.require(:user).permit :full_name, :gender, :birthday, :biography,
      :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    verify_info @user
  end

  def correct_user
    load_user

    return if current_user.is? @user
    flash[:danger] = t ".correct"
    redirect_to root_url
  end
end
