//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery ->
	$('.alert').click ->
		$(this).hide('slow')