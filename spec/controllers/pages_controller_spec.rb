require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'home' do
    it 'renders home page' do
      get :home
      expect(response).to render_template("home")
      expect(response).to have_http_status(200)
    end
  end
end
