class Type < ActiveRecord::Base
  belongs_to :donation
  belongs_to :donation_type
end
