ActiveAdmin.register User do

  config.batch_actions = false

  scope :all, default: true
  controller do
    before_filter :update_scopes, :only => :index

    def update_scopes
      resource = active_admin_config

      Role.order(id: :asc).each do |r|
        next if resource.scopes.any? { |scope| scope.name == r.description }
        resource.scopes << (ActiveAdmin::Scope.new r.description do |user| 
          user.where(:role => r.id)
        end)
      end
    end
  end

  index do
    column("ID", :sortable => :id) {|user| link_to "#{user.id}", admin_user_path(user) }
    column("Name") {|user| link_to "#{user.name}", admin_user_path(user) }
    column :email
    column("Role") {|user| user.role.description}
    column :phone
    column :expiration
  end

  permit_params :name, :description, :expiration, :phone, :role_id, :email

  form title: 'Update User Information' do |f|
    f.semantic_errors

    f.inputs "User Details" do
      input :name
      input :role_id, :label => 'Role', :as => :select, :collection => Role.all.map{|r| ["#{r.description}", r.id]}
      input :email
      input :phone
      input :expiration, as: :datepicker, datepicker_options: { min_date: 5.years.ago.to_date, max_date: "+50Y" }
      input :description, as: :string
    end

    actions
  end

end
