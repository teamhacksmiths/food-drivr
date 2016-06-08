Rails.application.routes.draw do
  devise_for :users, skip: [:session,:password,:registration], :controllers => { :omniauth_callbacks => "callbacks" }

  root 'pages#index'

  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    # Namespace the entire API to v1
    namespace :v1 do
      # User's take an auth_token parameter for their restful routes
        # i.e. /users/:auth_token/whatever.  This is to enforce resourceful routes
      resources :users, :only => [:show, :create, :update], param: :auth_token do
        patch '/password-update' => 'users#update_password'
        resources :organization, :only => [:show, :create, :update, :destroy]
      end


      namespace :donor do
        get 'donations' => 'donor_donations#index'
        get 'donations/all' => 'donor_donations#index', as: :donor_donations_all
        post 'donations' => 'donor_donations#create', as: :donor_donations_create
        get 'donations/:id' => 'donor_donations#show'
        patch 'donations/:id' => 'donor_donations#update'
      end

      # The driver namespace allows for convenience routes for most Driver actions
      namespace :driver do
        # Status endpoint will get the status of a pending driver, before they are activated.
        get 'status' => 'driver#check_status', as: :check_status
        # Get all donations, ALL Pending and ALL attached to a driver as an array
        get 'donations/all' => 'driver_donations#index', as: :donations_all
        # Get ALL pending donations
        get 'donations/pending' => 'driver_donations#pending', as: :donations_pending
        # Get a list of donations that were completed by the current driver
        get 'donations/completed' => 'driver_donations#completed', as: :donations_completed
        # Get a list of donations that have been accepted by the current driver
        get 'donations/accepted' => 'driver_donations#accepted', as: :donations_accepted
        # Get a list of donations that have been cancelled by the current driver
        get 'donations/cancelled' => 'driver_donations#cancelled', as: :donations_cancelled
        # Get a single donation for a driver
        get 'donations/:donation_id' => 'driver_donations#show'
        # Update the status of a specific donation by the current driver
        post 'donations/:donation_id/status' => 'driver_donations#status'
        # Update a single donation (Any specific changes that need to be made BY a Driver)
        patch 'donations/:donation_id' => 'driver_donations#update'
      end
      resources :donations, :only => [:show, :index, :update]
      resources :sessions, :only => [:create, :destroy], param: :auth_token
    end
  end
end
