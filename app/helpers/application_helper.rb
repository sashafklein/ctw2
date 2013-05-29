module ApplicationHelper
	def nav_class(action, page, other=nil)
		if action == page
      "active #{other if other}"
    else
	  	"#{other if other}"
    end
	end

end
