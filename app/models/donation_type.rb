class DonationType < ActiveRecord::Base
  has_many :types
  has_many :donations, through: :type
end
