class Setting < ActiveRecord::Base
  belongs_to :user
  after_initialize :set_defaults

  def set_defaults
    if self.active.nil?
      if user && user.role_id = 0
        self.active = true
      else
        self.active = false
      end
    end
    self.notifications = false if self.notifications.nil?
  end
end
