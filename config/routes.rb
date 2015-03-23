Rails.application.routes.draw do
  resources :disclosures
  resources :tags, only: [:show, :index]

  get 'faq/index'

  root 'welcome#index'
end
