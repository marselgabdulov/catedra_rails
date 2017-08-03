require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  before(:each) do
    @admin = sign_in create(:user, admin: true)
    @announcement = create(:announcement)
  end

  describe "show action" do
    it "renders show template if a announcement is found" do
      get :show, params: { id: @announcement.id }
      expect(response).to render_template(:show)
    end
  end

  describe "create action" do
    it "renders new page if validates fail" do
      post :create, params: { announcement: { title: "Заголовок", body: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe "update action" do
    it "updates the announcement and redirects to itself" do
      patch :update, params: { user_id: @admin, id: @announcement.id, announcement: { title: "Заголовок", body: "Текст" } }
      expect(response).to redirect_to(@announcement)
    end

    it "renders 403 page if user is not an admin" do
      sign_out(:user)
      sign_in create(:user)
      patch :update, params: { user_id: @admin, id: @announcement.id, announcement: { title: "Заголовок", body: "Текст" } }
      expect(response.status).to eq(403)
    end
  end

  describe "delete action" do
    it "redirects to index action when a announcement is destroyed" do
      delete :destroy, params: { id: @announcement.id }
      expect(response).to redirect_to(root_path)
    end

    it "renders 403 page if user is not an author" do
      announcement = create(:announcement)
      sign_out(:user)
      sign_in create(:user)
      delete :destroy, params: { id: announcement.id }
      expect(response.status).to eq(403)
    end
  end

end
