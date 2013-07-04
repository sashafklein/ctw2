class UsersBoxes
  include Mongoid::Document
  field :box_id, type: Integer
  field :user_id, type: Integer

  belongs_to :user
  belongs_to :box
end
