class User
  include MongoMapper::Document

  key :first_name, String
  key :last_name, String
  key :phone, String
  key :height, Integer
  key :weight, Integer
  key :birthdate, Date
  key :email_verification_code, String
  key :email_verified, Boolean
  key :phone_verification_code, String
  key :phone_verified, Boolean
  key :pro_user, Boolean
  key :active, Boolean
  key :created_at, Boolean

end
