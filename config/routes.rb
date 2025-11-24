Rails.application.routes.draw do
  # Devise authentication for users
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks",
  }

  # Root
  root to: "pages#home"

  # Static pages
  get "/about", to: "pages#about"
  get "/privacy", to: "pages#privacy"
  get "/feedback", to: "pages#feedback"
  post "/feedback", to: "pages#submit_feedback"
  get "/thank-you", to: "pages#thank_you"

  # Consultation requests
  resources :consultation_requests, only: [:new, :create]

  # Gift guides and products
  resources :gift_guides, only: [:index, :show] do
    resources :products, only: [:index]
  end

  resources :products, only: [:index, :show]

  resources :occasions, only: [:index, :show] do
    resources :gift_guides, only: [:index]
  end

  # Recipients (browsing/filtering)
  resources :recipients, only: [:index]

  # Experiences (user reviews/testimonials)
  resources :experiences, only: [:index, :new, :create, :show]

  # User dashboard
  get "/dashboard", to: "users#dashboard", as: :user_dashboard

  # Admin panel
  namespace :admin do
    root to: "dashboard#index"
    resources :gift_guides
    resources :products
    resources :occasions
    resources :experiences, only: [:index, :show, :destroy]
    resources :consultation_requests, only: [:index, :show, :destroy]
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA (if needed later)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
