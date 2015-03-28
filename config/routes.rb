Rails.application.routes.draw do
  resources :innovations
  resources :tags, only: [:show, :index]
  resources :search, only: [:index]

  get 'faq/index'

  root 'welcome#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

end
