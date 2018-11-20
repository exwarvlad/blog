Rails.application.routes.draw do
  root to: 'categories#index'
  resources :categories do
    resources :comments, only: :create, module: :categories

    resources :posts, except: :index do
      resources :comments, only: :create, module: :posts
    end
  end
end
