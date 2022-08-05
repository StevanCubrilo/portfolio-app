Rails.application.routes.draw do
  root "pages#home"
  resources :portfollios
  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
 
  
  resources :blogs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
