Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home', to: 'pages#home'
  root to: 'pages#home'

  get 'rules', to: 'pages#rules'
  get 'schedule', to: 'pages#schedule'
  get 'enlightenment', to: 'pages#enlightenment'
  get 'calendar', to: 'pages#calendar'
  get 'contacts', to: 'pages#contacts'

  resources :clerics
  resources :announcements, except: [:index]
end
