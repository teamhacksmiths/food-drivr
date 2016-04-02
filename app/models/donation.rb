class Donation < ActiveRecord::Base
  has_many :participants :class_name => "User", :foreign_key "user_id"
end
