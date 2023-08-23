Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#welcome"
  resources :categories do
    get "new_spending", to: "categories#new_spending"
    post "new_spending", to:
    "categories#create_spending"
  end
  
end
