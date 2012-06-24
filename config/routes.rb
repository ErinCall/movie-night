MovieNight::Application.routes.draw do
  resources :movies do
    post 'vote', on: :member
  end

  devise_for :users

  root :to => 'movies#index'
end
