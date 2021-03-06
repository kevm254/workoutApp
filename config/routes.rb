Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  get 'dashboard/index'

  root to: 'dashboard#index'

  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  resources :users do
    resources :exercises
  end

  resources :friendships, only: [:show, :create, :destroy]
end
