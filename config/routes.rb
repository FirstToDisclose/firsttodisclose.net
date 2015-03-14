Rails.application.routes.draw do
  get 'faq/index'

  root 'welcome#index'
end
