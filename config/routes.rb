
Rails.application.routes.draw do
  devise_for :users, skip: [:session,:password,:registration]

  root 'application#index'

  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    # TODO: enforce namespace / versioning: constraints: ApiConstraints.new(version: 1, default: true)
    namespace :v1 do
      get '/user', to: 'users#show'
      resources :users, :only => [:show, :create, :update], param: :auth_token
      resources :donor do
        resources :donations, :only => [:create, :update, :destroy]
      end
      resources :driver, :only => [:index, :show] do
        resources :dropoffs, :only => [:create, :update, :destroy]
        resources :pickups, :only => [:create, :update, :destroy]
      end
      resources :donations, :only => [:show, :index]
      resources :sessions, :only => [:create, :destroy]
    end
  end
end
