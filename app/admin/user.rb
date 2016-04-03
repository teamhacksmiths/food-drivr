ActiveAdmin.register User do

  config.batch_actions = false

  scope :all, default: true
  scope("Donors") {|scope| scope.where("users.role_id=?", 0)}
  scope("Drivers") {|scope| scope.where("users.role_id=?", 1)}
  scope("Others") {|scope| scope.where("users.role_id=?", 2)}

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
