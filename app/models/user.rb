class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :email, type: String
  field :height, type: Integer
  field :weight, type: Integer
  field :birthdate, type: Date
  field :email_verification_code, type: String
  field :email_verified, type: Boolean
  field :phone_verification_code, type: String
  field :phone_verified, type: Boolean
  field :pro_user, type: Boolean
  field :active, type: Boolean
  field :created_at, type: Date

  # Include default devise modules. Others available below.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  def full_name
    "#{first_name} #{last_name}"
  end


#####################
## Optional Devise ##
#####################

 ## Other availabale Modules
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

 ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # validates :email, presence: true, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})$/i }
  # validates_presence_of :phone, length: 10

end
