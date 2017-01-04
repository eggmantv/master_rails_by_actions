Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  namespace :admin do
    root 'sessions#new'
    resources :sessions
    resources :categories
  end
end
