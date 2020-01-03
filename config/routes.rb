Rails.application.routes.draw do
  root to: 'toppage#index'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions",
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    post    "sign_in",             to: "devise/sessions#new"
    delete  "sign_out",            to: "devise/sessions#destroy"
    get     "index",               to: "users/registrations#index"
    get     "profile",             to: "users/registrations#profile"
    get     "sms",               to: "users/registrations#sms"
    get     "sms_confirmation",to: "users/registrations#sms_confirmation"
    get     "address",             to: "users/registrations#address"
    get     "credit",              to: "users/registrations#credit"
    get     "done",            to: "users/registrations#done"
    post    "done",            to: "devise/registrations#create"
  end
  
  resources :users, only: [:show, :edit] 
  resources :toppage, only: [:index]
end
