require 'rails_helper'

RSpec.describe Admin::RewardsController, type: :controller do

  let(:admin) { User.create(username: "hansolo", password: "password", password_confirmation: "password", role: 1)}

  let(:valid_attributes) {
    {title: "Toy Yoda", description: "It's a toy yoda", cost: 5}
  }

  let(:invalid_attributes) {
    {title: nil, description: nil, cost: nil}
  }

  let(:valid_session) { {user_id: admin.id} }

  describe "GET #new" do
    it "assigns a new reward as @reward" do
      get :new, {}, valid_session
      expect(assigns(:reward)).to be_a_new(Reward)
    end
  end

  describe "GET #edit" do
    it "assigns the requested reward as @reward" do
      reward = Reward.create! valid_attributes
      get :edit, {:id => reward.to_param}, valid_session
      expect(assigns(:reward)).to eq(reward)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Reward" do
        expect {
          post :create, {:reward => valid_attributes}, valid_session
        }.to change(Reward, :count).by(1)
      end

      it "assigns a newly created reward as @reward" do
        post :create, {:reward => valid_attributes}, valid_session
        expect(assigns(:reward)).to be_a(Reward)
        expect(assigns(:reward)).to be_persisted
      end

      it "redirects to the reward" do
        post :create, {:reward => valid_attributes}, valid_session
        reward = Reward.all.first
        expect(response).to redirect_to(admin_reward_path(reward))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved reward as @reward" do
        post :create, {:reward => invalid_attributes}, valid_session
        expect(assigns(:reward)).to be_a_new(Reward)
      end

      it "re-renders the 'new' template" do
        post :create, {:reward => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {title: "Toy Bacca", description: "It's a toy chewbacca", cost: 9}
      }

      it "updates the requested reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => new_attributes}, valid_session
        reward.reload
        expect(reward.title).to eq 'Toy Bacca'
        expect(reward.cost).to eq 9
      end

      it "assigns the requested reward as @reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}, valid_session
        expect(assigns(:reward)).to eq(reward)
      end

      it "redirects to the reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_reward_path(reward))
      end
    end

    context "with invalid params" do
      it "assigns the reward as @reward" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => invalid_attributes}, valid_session
        expect(assigns(:reward)).to eq(reward)
      end

      it "re-renders the 'edit' template" do
        reward = Reward.create! valid_attributes
        put :update, {:id => reward.to_param, :reward => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested reward" do
      reward = Reward.create! valid_attributes
      expect {
        delete :destroy, {:id => reward.to_param}, valid_session
      }.to change(Reward, :count).by(-1)
    end

    it "redirects back to the rewards" do
      reward = Reward.create! valid_attributes
      delete :destroy, {:id => reward.to_param}, valid_session
      expect(response).to redirect_to(admin_rewards_path)
    end
  end
end
