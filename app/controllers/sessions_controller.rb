class SessionsController < ApplicationController
  skip_before_action :current_user?, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password]) && @user.admin?
      session[:user_id] = @user.id
      redirect_to admin_users_path
    elsif @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
