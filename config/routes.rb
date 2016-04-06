
Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    # TODO: enforce namespace / versioning: constraints: ApiConstraints.new(version: 1, default: true)
    namespace :v1 do
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :donations, :only => [:create, :update, :destroy]
      end
      resources :donations, :only => [:show, :index]
      resources :sessions, :only => [:create, :destroy]
    end
  end
end
