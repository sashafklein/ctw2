class Workout
  include Mongoid::Document

  belongs_to :user

  field :name, type: String
  field :user_id, type: Integer
  field :description, type: String
  field :score, type: String
  field :created_at, type: Date

  def abridged_description
  	if description
  		return description if description.length < 25
  		return "#{description[0..22]}..."
  	else
  		"No description -- #{link_to 'write one!', '#' }"
  	end
  end

  # Currently just a test parser. Removes all punctuation.
  def self.parse_text(text)
    text.gsub(/[^0-9a-z ]/i, '')
  end

end
