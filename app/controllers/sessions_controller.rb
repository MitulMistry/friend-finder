class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user, notice: "Logged in as #{@user.username}"
    else
      redirect_to login_path, alert: 'Login failed'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
