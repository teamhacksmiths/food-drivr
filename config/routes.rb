Rails.application.routes.draw do
  devise_for :users, skip: [:session,:password,:registration], :controllers => { :omniauth_callbacks => "callbacks" }

  root 'pages#index'

  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    # TODO: enforce namespace / versioning: constraints: ApiConstraints.new(version: 1, default: true)
    namespace :v1 do
      resources :users, :only => [:show, :create, :update], param: :auth_token do
        resources :organization, :only => [:show, :create, :update, :destroy]
      end
      resources :donor, :only => [:show]
      namespace :donor do
        get 'donations' => 'donor_donations#index'
      end
      namespace :driver do
        get 'donations' => 'driver_donations#index', as: :donations
      end
      resources :donations, :only => [:show, :index, :update]
      get 'donationspending' => 'donationspending#index'

      resources :sessions, :only => [:create, :destroy]
    end
  end
end
