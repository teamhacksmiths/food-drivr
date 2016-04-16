class Setting < ActiveRecord::Base
  belongs_to :user
  after_initialize :set_defaults

  def set_defaults
    self.notifications = false
    user = User.find(user.id)
    if user
      if user.role = Role.find_by(description: "Driver")
        self.active = false
      else
        self.active = true
      end
    end
  end
end
