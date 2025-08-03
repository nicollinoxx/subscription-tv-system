Rails.application.routes.draw do
  resources :signatures, except: [:edit, :update] do
    resources :invoices, module: :signatures, only: [:index]
    resource  :installment_book, module: :signatures, only: [:show]
  end

  resources :packages, except: [:destroy]
  resources :additional_services, except: [:destroy]
  resources :plans, except: [:destroy]
  resources :customers

  root "customers#index"
end
