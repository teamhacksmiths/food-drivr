class OrganizationAddress < ActiveRecord::Base
  belongs_to :organization

  def set_default(def)
    self.default = def
  end

end
