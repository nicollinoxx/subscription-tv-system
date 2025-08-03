Rails.application.routes.draw do
  resources :signatures, except: [:edit, :update] do
    resources :invoices, module: :signatures, only: [:index]
    resource  :installment_book, module: :signatures, only: [:show]
  end

  resources :packages
  resources :additional_services
  resources :plans
  resources :customers

  root "customers#index"
end
