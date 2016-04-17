ActiveAdmin.register Donation do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  config.batch_actions = false

  scope :all, default: true
  # DonationStatus.order(id: :asc).each do |s|
  #   scope(s.name) { |scope| scope.where("donations.status_id=?", s.id) }
  # end

  index do
    column("ID", :sortable => :id) {|d| link_to "#{d.id}", admin_donation_path(d) }
    # column("Status")               {|d| status_tag(d.status.name) }
    column("Recipient")            {|d| link_to d.recipient.name, admin_recipient_path(d.recipient) }
    column("Donor")                {|d| link_to d.donor.name, admin_user_path(d.donor) }
    column("Driver")               {|d| link_to d.driver.name, admin_user_path(d.driver) }
    column "Initiated", :created_at
    column "Updated", :updated_at
    actions
  end

  permit_params :donor_id, :driver_id, :recipient_id, :status_id

end
