class UsersController < ApplicationController
  before_action :load_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new user_signup_params

    if @user.save
      flash[:success] = t ".welcome"
      redirect_to @user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def show
  end

  private

  def user_signup_params
    params.require(:user).permit :full_name, :user_name, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    verify_info @user
  end
end
