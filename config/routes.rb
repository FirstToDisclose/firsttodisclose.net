Rails.application.routes.draw do
  resources :innovations
  resources :tags, only: [:show, :index]

  get 'faq/index'

  root 'welcome#index'
end
