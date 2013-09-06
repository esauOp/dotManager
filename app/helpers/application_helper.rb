module ApplicationHelper
	def bootstrap_class_for flash_type
		case flash_type
		when :success
			"alert-success"
		when :error
			"alert-danger"
		when :alert
			"alert-warning"
		when :notice
			"alert-info"
		else
			flash_type.to_s
		end
	end

	def message_class flash_type
		case flash_type
		when :success
			"success"
		when :error
			"error"
		when :alert
			"block"
		when :notice
			"info"
		else
			flash_type.to_s
		end		
	end

	def route_to_content (text, path)
		if current_page?(path)
			text
		end
	end
end
