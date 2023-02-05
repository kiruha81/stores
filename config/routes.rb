Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about", as: "about"
  resources :users
  resources :shops do
    resources :shop_comments, only: [:create, :destroy]
  end
end
