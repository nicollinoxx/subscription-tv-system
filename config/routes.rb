Rails.application.routes.draw do
  resources :signatures
  resources :packages
  resources :additional_services
  resources :plans
  resources :customers

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
