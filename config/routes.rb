Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # scope '/api' do
  #   scope '/v1' do
  #
  #   end
  # end
  # Api definition
  namespace :api, defaults: { format: :json },
                            constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do

    end
  end
end
