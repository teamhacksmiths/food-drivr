class AddUrlToDonationImages < ActiveRecord::Migration
  def change
    add_column :donation_images, :url, :string
  end
end
