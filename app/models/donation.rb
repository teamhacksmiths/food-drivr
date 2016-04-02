class Donation < ActiveRecord::Base
  belongs_to :donor, :class_name => "User", :foreign_key => "user_id"
  belongs_to :driver, :class_name => "User", :foreign_key => "user_id"
end
