class PointsController < ApplicationController
  def create
    user = User.friendly.find(params[:user_id])
    point = user.points.new
    if point.save
      redirect_to user, notice: "New point awarded"
    else
      flash.now[:errors] = point.errors.full_messages.join(", ")
      redirect_to user
    end
  end

  def destroy
    user = User.friendly.find(params[:user_id])
    point = user.points.first
    if point.destroy
      redirect_to user, notice: "Point removed"
    else
      flash.now[:errors] = point.errors.full_messagesjoin(", ")
      redirect_to user
    end
  end
end
