Forum::Application.routes.draw do
  resources :topics do
    resources :posts
  end

  devise_for :users

  root :to => 'topics#index'
end
