class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user?, only:[:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new valid_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "New user #{@user.username} created."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update valid_params
      redirect_to @user, notice: "Reward #{@user.username} updated."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Reward #{@user.username} removed."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      redirect_to @user
    end
  end

  private
  def valid_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
