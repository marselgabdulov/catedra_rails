require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  it 'renders home page' do
    get :home
    expect(response).to render_template("home")
    expect(response).to have_http_status(200)
  end



  it 'renders rules page' do
    get :rules
    expect(response).to render_template("rules")
    expect(response).to have_http_status(200)
  end

end
