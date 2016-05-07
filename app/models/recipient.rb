class Recipient < ActiveRecord::Base
  has_many :donations

  include Geocodable
  
end
