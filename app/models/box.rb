class Box
  include Mongoid::Document
  field :name, type: String

  has_and_belongs_to_many :users
  has_one :location
  
  accepts_nested_attributes_for :location
  
end
