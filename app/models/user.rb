class User
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String
  field :phone, type: String
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

  def full_name
    "#{first_name} #{last_name}"
  end

end
