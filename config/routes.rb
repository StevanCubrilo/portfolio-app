Rails.application.routes.draw do
  root "pages#home"
  resources :portfollios, except: [:show]
  get 'angular-items', to: 'portfollios#angular'
  get 'portfollio/:id', to: 'portfollios#show', as: 'portfollio_show'

  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
 
  
  resources :blogs do 
    member do
      get :toggle_status
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
