ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }


  # Setup a simple list of most recent donations
  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Pending Donations" do
          ul do
            Donation.most_recent.first(5).map do |donation|
              li link_to(donation.recipient.name, admin_donation_path(donation))
            end
          end
        end
      end
      column do
        panel "Recently Completed Donation" do

        end
      end
      column do
        panel "Recently Suspended Donations" do
          
        end
      end
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
