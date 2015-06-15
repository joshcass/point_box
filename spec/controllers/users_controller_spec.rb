require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    {username: "hansolo", password: "password", password_confirmation: "password"}
  }

  let(:invalid_attributes) {
    {username: nil}
  }

  let(:valid_session) { {} }

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, user_id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the user" do
        post :create, {:user => valid_attributes}, valid_session
        user = User.all.first
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { username: "darthvader"}
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, user_id: user.id
        user.reload
        expect(user.username).to eq 'darthvader'
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, user_id: user.id
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, user_id: user.id
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => invalid_attributes}, user_id: user.id
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => invalid_attributes}, user_id: user.id
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}, user_id: user.id
      }.to change(User, :count).by(-1)
    end

    it "redirects back to the users" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}, user_id: user.id
      expect(response).to redirect_to(users_path)
    end
  end
end
