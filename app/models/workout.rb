class Workout
	include Mongoid::Document

  field :name, type: String
  field :author_id, type: Integer
  field :description, type: String
  field :score, type: String
  field :created_at, type: Date

end
