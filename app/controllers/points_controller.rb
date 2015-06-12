class PointsController < ApplicationController
  def create
    @point = Point.new valid_params
    if @point.save
      redirect_to rewards_path, notice: "New point awarded"
    else
      flash.now[:errors] = @point.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @point = Point.find(params[:id])
    if @point.destroy
      redirect_to rewards_path, notice: "Point removed"
    else
      flash.now[:errors] = @point.errors.full_messagesjoin(", ")
      render nothing: true
    end
  end

  private
  def valid_params
    params.require(:point).permit(:status)
  end
end
