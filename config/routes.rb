Rails.application.routes.draw do

  resource :user

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"
    end
    resources :users do
      resource :profile, :controller => "user_profiles"
    end
  end

  root "events#index"
  get "/faq" => "pages#faq"

end
