class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user?

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new valid_params
    if @user.save
      redirect_to admin_user_path(@user), notice: "New user #{@user.username} created."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update valid_params
      redirect_to admin_user_path(@user), notice: "User #{@user.username} updated."
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "User #{@user.username} removed."
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
    @user = User.friendly.find(params[:id])
  end
end
