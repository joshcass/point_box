class RewardsController < ApplicationController
  skip_before_action :current_user?, only: [:index]

  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.friendly.find(params[:id])
  end
end
