module ApplicationHelper

	def active?(specified_tab)
		if "controller.action_name" == specified_tab
      "active"
    else
	  	""
    end
	end

  def attr_or_edit(user, attribute)
  	return attribute if attribute
  	link_to "Incomplete! -- edit your info", edit_user_path(user)
  end

  def name_or_no(user)
  	return user.name if user.name
		"TBNamed"
  end

end
