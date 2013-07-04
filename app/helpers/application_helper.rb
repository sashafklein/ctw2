module ApplicationHelper

	def active?(specified_tab)
		if controller.action_name == specified_tab
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

  def edit_or_log
    if controller.action_name == "new"
      "Log"
    else
      "Edit"
    end
  end

  def date_in_words(date)
    date.strftime("%B %d, %Y")
  end

  def format_attribute(name)
    name.split("_").map(&:capitalize).join(" ")
  end
end
