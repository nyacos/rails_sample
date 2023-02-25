Rails.application.routes.draw do
  root 'post#index'
  resources :posts do
    resources :comments
  end
  resources :boards
end
