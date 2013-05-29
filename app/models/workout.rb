class Workout
  include MongoMapper::Document

  key :name, String
  key :author_id, Integer
  key :description, String
  key :score, String
  key :created_at, Date

end
