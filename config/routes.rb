
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # scope '/api' do
  #   scope '/v1' do
  #
  #   end
  # end
  # Api definition
  # namespace :api, defaults: { format: :json },
  #                             path: '/'  do
  #                             scope module: :v1,
  #                                       constraints: ApiConstraints.new(version: 1, default: true) do
  #     # We are going to list our resources here
  #     resources :users, :only => [:show]
  #   end
  # end
end
