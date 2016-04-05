class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
end
