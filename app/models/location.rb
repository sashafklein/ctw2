class Location
  include Mongoid::Document
  field :state, type: String
  field :city, type: String
  field :street_address, type: String
  field :zipcode, type: String
  field :box_id, type: Integer

  belongs_to :box
end
