Rails.application.routes.draw do
  resources :meez_en_places
  resources :recipe_modifiers do
    get :desired_yield_page, on: :collection
    post 'scale_recipe', on: :collection
  end

  devise_for :users

  root "home#index"
  
end
