class PurchasesController < ApplicationController
  def create
    reward = Reward.friendly.find(params[:reward_id])
    purchase = reward.purchases.new user: current_user
    if purchase.execute
      redirect_to current_user, notice: "#{reward.title} purchased for #{reward.cost} points!"
    else
      flash[:errors] = "Not enough points for this purchase."
      redirect_to reward
    end
  end
end
