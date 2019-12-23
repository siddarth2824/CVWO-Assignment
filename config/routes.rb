Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'tags/:tag', to: 'articles#index', as: :tag

  resources :tasks do
    member do
      patch :complete
    end
  end
  
  resources :tags
  
end

