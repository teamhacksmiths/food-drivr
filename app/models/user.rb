class User < ActiveRecord::Base
  before_create :generate_authentication_token!
  validates :auth_token, uniqueness: true
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :donations, foreign_key: "donor_id", class_name: "Donation"

  # Make sure to access with the role.description
  belongs_to :role

  def role
    self.role.name
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
