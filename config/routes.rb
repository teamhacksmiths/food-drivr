
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # scope '/api' do
  #   scope '/v1' do
  #
  #   end
  # end
  # Api definition
  scope '/api' do
    scope '/v1' do
      scope '/donations' do
        get '/' => 'api_donations#create'
        post '/' => 'api_donations#create'
      end
    end
  end
end
