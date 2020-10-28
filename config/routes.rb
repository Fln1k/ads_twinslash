Rails.application.routes.draw do
  root to: 'ads#index'

  get "ads/new_ads"
  get "ads/archive_ads"
  get "ads/approved_ads"
  get "admin_actions/deny"
  get "admin_actions/approve"
  get "user_actions/to_draft"
  get "user_actions/to_new"
  get "ads/myads", to: "ads#myads"

  devise_for :users
  resources :users
  resources :ads
  resources :ads_types
end
