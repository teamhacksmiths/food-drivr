ActiveAdmin.register Donation do

  config.batch_actions = false

  scope :all, default: true

  controller do
    before_filter :update_scopes, :only => :index

    def update_scopes
      resource = active_admin_config

      DonationStatus.order(id: :asc).each do |s|
        next if resource.scopes.any? { |scope| scope.name == s.name  }
        resource.scopes << (ActiveAdmin::Scope.new s.name do |donations| 
          donations.where(:status_id => s.id)
        end)
      end
    end
  end

  index do
    column("ID", :sortable => :id) {|d| link_to "#{d.id}", admin_donation_path(d) }
    column("Status")               {|d| status_tag(d.status.name) }
    column("Recipient")            {|d| link_to d.recipient.name, admin_recipient_path(d.recipient) }
    column("Donor")                {|d| link_to d.donor.name, admin_user_path(d.donor) }
    column("Driver")               {|d| link_to d.driver.name, admin_user_path(d.driver) }
    column "Initiated", :created_at
    actions
  end

  permit_params :donor_id, :driver_id, :recipient_id, :status_id

end
