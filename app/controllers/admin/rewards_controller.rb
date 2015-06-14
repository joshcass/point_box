class Admin::RewardsController < Admin::BaseController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user?

  def index
    @rewards = Reward.all
  end

  def show

  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new valid_params
    if @reward.save
      redirect_to admin_reward_path(@reward), notice: "New reward #{@reward.title} created."
    else
      flash.now[:errors] = @reward.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit

  end

  def update
    if @reward.update valid_params
      redirect_to admin_reward_path(@reward), notice: "Reward #{@reward.title} updated."
    else
      flash.now[:errors] = @reward.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if @reward.destroy
      redirect_to admin_rewards_path, notice: "Reward #{@reward.title} removed."
    else
      flash.now[:errors] = @reward.errors.full_messages.join(", ")
      redirect_to @reward
    end
  end

  private
  def valid_params
    params.require(:reward).permit(:title, :description, :cost, :image)
  end

  def set_reward
    @reward = Reward.friendly.find(params[:id])
  end
end
