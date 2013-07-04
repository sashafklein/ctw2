class User
  include Mongoid::Document

  ## DEVISE STUFF AT BOTTOM, BECAUSE IT'S ANNOYING ##

  has_many :workouts
  has_and_belongs_to_many :boxes

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
  field :height, type: Integer
  field :weight, type: Integer
  field :birthdate, type: Date
  field :email_verification_code, type: String
  field :email_verified, type: Boolean, default: false
  field :phone_verification_code, type: String
  field :phone_verified, type: Boolean, default: false
  field :pro_user, type: Boolean
  field :active, type: Boolean
  field :created_at, type: Date
  field :role, type: String, default: "user"

  def profile_complete
    if weight && height && name && birthdate
      return true
    else
      return false
    end
  end

  def full_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      false
    end
  end

  def name
    full_name
  end

  def admin?
    return true if role == "admin"
    false
  end

  def formatted_phone
    "(#{phone[0..2]})-#{phone[3..5]}-#{phone[6..9]}" if phone
  end

  def self.find_by_phone(number)
    where(:phone => number).first
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  
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

end
