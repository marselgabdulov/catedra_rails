require 'rails_helper'

RSpec.describe ClericsController, type: :controller do
  before(:each) do
    @admin = sign_in create(:user, admin: true)
    @cleric = create(:cleric)
  end

  describe "show action" do
    it "renders show template if a cleric is found" do
      get :show, params: { id: @cleric.id }
      expect(response).to render_template(:show)
    end

    it "renders 404 page if an cleric is not found" do
      expect(->{get :show, params: { id: 0 }}).to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

  describe "create action" do
    it "redirects to cleric_path if validates pass" do
      post :create, params: { cleric: { name: "Михаил", position: "Викарий" } }
      expect(response).to redirect_to(clerics_path)
    end

    it "renders new page if validates fail" do
      post :create, params: { cleric: { name: "Михаил", position: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe "update action" do
    it "updates the cleric and redirects to itself" do
      patch :update, params: { user_id: @admin, id: @cleric.id, cleric: { name: "Михаил", position: "Викарий" } }
      expect(response).to redirect_to(@cleric)
    end

    it "renders 403 page if user is not an admin" do
      sign_out(:user)
      sign_in create(:user)
      patch :update, params: { user_id: @admin, id: @cleric.id, cleric: { name: "Михаил", position: "Викарий" } }
      expect(response.status).to eq(403)
    end
  end

  describe "delete action" do
    it "redirects to index action when a cleric is destroyed" do
      delete :destroy, params: { id: @cleric.id }
      expect(response).to redirect_to(clerics_path)
    end

    it "renders 403 page if user is not an author" do
      cleric = create(:cleric)
      sign_out(:user)
      sign_in create(:user)
      delete :destroy, params: { id: cleric.id }
      expect(response.status).to eq(403)
    end
  end

end
