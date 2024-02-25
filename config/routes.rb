Rails.application.routes.draw do
  resources :recipe_modifiers
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb
  resources :recipe_modifiers do
    member do
      get 'adjust_yield'
    end
  end
  
  
 
end
