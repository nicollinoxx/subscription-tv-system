Rails.application.routes.draw do
  resources :signatures do
    resources :bills, module: :signatures, only: [:index]
  end

  resources :packages
  resources :additional_services
  resources :plans
  resources :customers

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
