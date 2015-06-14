class Admin::PointsController < Admin::BaseController
  before_action :set_user
  def create
    if valid_quantity?
      @user.points.award(params[:quantity])
      redirect_to admin_user_path(@user), notice: "New point awarded"
    else
      flash[:errors] = "Quantity must be a valid number input."
      redirect_to admin_user_path(@user)
    end
  end

  def destroy
    if valid_quantity?
      @user.points.retract(params[:quantity])
      redirect_to admin_user_path(@user), notice: "Point removed"
    else
      flash[:errors] = "Quantity must be a valid number input."
      redirect_to admin_user_path(@user)
    end
  end

  private
  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def valid_quantity?
    params[:quantity] && !params[:quantity].blank?
  end
end
