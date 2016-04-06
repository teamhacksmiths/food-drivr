class Recipient < ActiveRecord::Base
  has_many :donations
end
