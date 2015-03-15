Rails.application.routes.draw do
  devise_for :users
  resources :disclosures

  get 'faq/index'

  root 'welcome#index'
end
