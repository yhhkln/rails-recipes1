Rails.application.routes.draw do

  resource :user

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events
    resources :users
  end

  root "events#index"
  get "/faq" => "pages#faq"

end
