class BoxDecorator < Draper::Decorator
  delegate_all

  def state
  	model.location ? model.location.state : "None Listed"
  end

  def city
  	model.location ? model.location.city : "None Listed"
  end

  def address
  	model.location ? model.location.street_address : "None Listed"
  end

  def zip
  	model.location ? model.location.zipcode : "None Listed"
  end

  def location_attributes
  	model.location.attributes.select{ |attr| !attr[0].include?("id") } if model.location
  end
end
