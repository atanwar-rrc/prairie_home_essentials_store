# config/routes.rb

Rails.application.routes.draw do
  # Customer-facing root and products
  root "products#index"
  resources :products, only: [:index, :show]

  # Shopping cart routes
  get    "cart",          to: "cart#show",   as: :cart
  post   "cart/:id",      to: "cart#add",    as: :add_to_cart
  delete "cart/:id",      to: "cart#remove", as: :remove_from_cart
  patch  "cart/:id",      to: "cart#update", as: :update_cart

  # Checkout routes
  get  "checkout", to: "orders#new",    as: :new_order
  post "checkout", to: "orders#create", as: :orders

  # Admin/Devise routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Static pages (about, contact, etc.)
  get "/:slug", to: "pages#show", as: :page
end
