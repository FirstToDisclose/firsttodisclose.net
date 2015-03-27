Rails.application.routes.draw do
  resources :innovations
  resources :tags, only: [:show, :index]
  resources :search, only: [:index]

  get 'faq/index'

  root 'welcome#index'
end
