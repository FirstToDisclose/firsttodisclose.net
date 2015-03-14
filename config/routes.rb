Rails.application.routes.draw do
  resources :disclosures

  get 'faq/index'

  root 'welcome#index'
end
