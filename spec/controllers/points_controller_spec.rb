require 'rails_helper'

RSpec.describe PointsController, type: :controller do
  let(:valid_attributes) {{status: "awarded"}}
  let(:valid_session){{}}

 describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Point' do
        expect {
          post :create, {:point => valid_attributes}, valid_session
        }.to change(Point, :count).by(1)
      end

      it "assigns a newly created point as @point" do
        post :create, {:point => valid_attributes}, valid_session
        expect(assigns(:point)).to be_a(Point)
        expect(assigns(:point)).to be_persisted
      end

      xit "redirects to the points user" do
        post :create, {:point => valid_attributes}, valid_session
        point = Point.all.first
        expect(response).to redirect_to(point.contact)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested point" do
      point = Point.create! valid_attributes
      expect {
        delete :destroy, {:id => point.to_param}, valid_session
      }.to change(Point, :count).by(-1)
    end

    xit "redirects back to the user" do
      point = Point.create! valid_attributes
      delete :destroy, {:id => point.to_param}, valid_session
      expect(response).to redirect_to(point.contact)
    end
  end
end


