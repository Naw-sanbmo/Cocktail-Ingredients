Rails.application.routes.draw do
  get 'review/new'
  get 'review/create'
  get 'cocktails/index'
  get 'cocktails/show'
  get 'cocktails/new'
  get 'cocktails/create'
  root to: "cocktails#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :cocktails do
    resources :doses, only: %i[new create edit update destroy]
    resources :reviews, only: %i[new create destroy]
  end
end
