Rails.application.routes.draw do
  get 'boards/index'
  get 'boards/new'
  get 'boards/show'
  get 'boards/edit'
  resources :posts
  root :to => 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
