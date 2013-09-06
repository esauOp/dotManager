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

	def route_title
		if current_page?(root_path)
			"Dashboard"
		elsif current_page?(usuarios_path)
			"Users"
		elsif current_page?(teams_path)			
			"Teams"
		elsif current_page?(clientes_path)			
			"Clients"
		elsif current_page?(task_cats_path)			
			"Task Categories"
		elsif current_page?(task_priorities_path)			
			"Task Priorities"
		elsif current_page?(task_statuses_path)			
			"Task Statuses"
		elsif current_page?(projects_path)			
			"Projects"
		elsif current_page?(project_path)
			@project.name.to_s
		elsif current_page?(project_task_path)
			@task.name.to_s
		else
			#Rails.root.to_s
			arr = request.original_fullpath.to_s.gsub(/-+/, ' ').split("/")
			i = arr.length

			arr[i-1].to_s.slice(0,1).capitalize + arr[i-1].to_s.slice(1..-1)

			# .downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
			# .gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
		end
	end


end
