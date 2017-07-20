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

  it 'renders schedule page' do
    get :schedule
    expect(response).to render_template("schedule")
    expect(response).to have_http_status(200)
  end

  it 'renders enlightenment page' do
    get :enlightenment
    expect(response).to render_template("enlightenment")
    expect(response).to have_http_status(200)
  end

  it 'renders calendar page' do
    get :calendar
    expect(response).to render_template("calendar")
    expect(response).to have_http_status(200)
  end

end
