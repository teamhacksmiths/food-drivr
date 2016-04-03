
Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :donations
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end
end
