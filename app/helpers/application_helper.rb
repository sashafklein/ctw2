module ApplicationHelper

	def active?(specified_tab)
		if "controller.action_name" == specified_tab
      "active"
    else
	  	""
    end
	end

end
