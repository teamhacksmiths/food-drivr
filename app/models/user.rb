class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter, :facebook]

  before_create :generate_authentication_token!
  after_initialize :set_defaults

  validates :auth_token, uniqueness: true
  validates :role, presence: true

  has_one :organization
  has_one :setting, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :setting
  accepts_nested_attributes_for :organization
  has_many :addresses, foreign_key: "user_id", class_name: "DonorAddress"
  accepts_nested_attributes_for :addresses

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :role, presence: true

  # User has a role_id, determing their type / role, i.e.
    # "Donor", "Driver", "Other"
  belongs_to :role


  alias :settings :setting   # not wrong, only for getter
  alias :settings= :setting=  # add this for setter

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  # Generate an auth_token for a user upon saving of record, enabling easy
    # Authentication
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_defaults
    match_type_to_role
    set_default_settings
  end

  def set_default_settings
    unless self.setting != nil
      if self.role_id == 0
        self.setting = Setting.create(active: true, notifications: false)
      else
        self.setting = Setting.create(active: false, notifications: false)
      end
    end
  end

  # Match the type of user to role and visa versa, providing backwords compatibility
  def match_type_to_role
    if self.role != nil || self.role_id != nil
      if !self.type || self.role.description.downcase != self.type.downcase
        @type = self.role.description.to_s.capitalize
        begin
          self.becomes!(Object.const_get(@type))
        rescue StandardError => error
          puts "Unable to convert type to: #{@type}"
        end
      end
    end
  end

  # Returns the first of addresses where default is true
  # @param None
  # @return Either the first default address or the first address if there is
    # No default address
  def default_address
    default_addresses = self.addresses.where(default: true)
    if default_addresses.count == 0
      self.addresses.first
    else
      default_addresses.first
    end
  end

  # Update the password with a new password
    # @param params a hash containing the submitted database
    # @param *options - an array of optional options.
    # @return result - The result of the transaction for updating the password.
  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)
    result =  if valid_password? current_password
                update_attributes(params, *options)
              else
                self.assign_attributes(params, *options)
                self.valid?
                self.errors.add(:current_user, current_password.blank? ? :blank : :invalid)
                false
              end
    clean_up_passwords
    result
  end
  def clean_up_passwords
    #TODO: Implement solution for cleaning up passwords
  end
end
