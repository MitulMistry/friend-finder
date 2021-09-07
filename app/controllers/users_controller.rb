class UsersController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_ownership, only: [:edit, :update, :destroy]

  def index
    @users = User.ordered_newest
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Account created successfully'
    else
      render :new, alert: 'Account creation failed'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Account updated successfully'
    else
      render :edit, status: :bad_request, alert: 'Account update failed'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    logout
    redirect_to root_path, notice: 'Account deleted'
  end

  #-------------------------------
  private

  def find_user
    @user = User.find(params[:id])
  end

  def authorize_ownership
    if @user.id != session[:user_id]
      redirect_to users_path, alert: 'You do not have required permissions'
      return # guard clause
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :bio, :password, :password_confirmation)
  end
end
