Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # --- private pages
  get 'dashboard/index', as: :dashboard
  # --- static pages (public)
  root "pages#show", page: "home"
  get "pages/*page" => "pages#show"
end
