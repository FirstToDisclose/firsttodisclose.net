Rails.application.routes.draw do
  resources :collections, only: [:new, :create, :show, :index] do
    resources :collection_innovations, only: [:new, :create]
  end

  resources :innovations do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :innovations, only: [:index, :show, :update]
  end

  resources :tags, only: [:show, :index]
  resources :search, only: [:index]
  resources :revisions, only: [:index, :show]
  resources :live_pages, only: [:index, :new, :create]

  get 'faq/index'

  root 'welcome#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :signout

  end

end
