Rails.application.routes.draw do
  resources :meez_en_places
  resources :recipe_modifiers do
    get :desired_yield_page, on: :collection
    post 'scale_recipe', on: :collection
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  # config/routes.rb
 
 
  
end
