Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :tasks do
    member do
      patch :complete
    end
  end
  
  resources :tags
  
end

