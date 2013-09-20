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
		elsif current_page?(teams_path)			
			"Teams"
		elsif current_page?(usuarios_path)
			"Users"
		elsif params[:controller] == 'usuarios/edit'
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
		elsif params[:controller] == 'projects'
			@project.name.to_s
		elsif params[:controller] == 'tasks'
			if !@task.blank?
				@task.name.to_s
			end
		elsif current_page?(calendar_path)
			"Calendar"
		else
			#Rails.root.to_s
			arr = request.original_fullpath.to_s.gsub(/-+/, ' ').split("/")
			i = arr.length

			arr[i-1].to_s.slice(0,1).capitalize + arr[i-1].to_s.slice(1..-1)

			# .downcase.gsub(/\W+/, "-").gsub(/^[-]+|[-]$/,"").strip
			# .gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
		end
	end

	def task_timer
		if current_usuario.admin
			@tasktimer = Task.where(running: true).first #Task.find(1)
		else		
			@tasktimer = Task.where(assignee_id: current_usuario.id, running: true).first #Task.find(1)
		end
		#@tasktimer = Task.where(assignee_id: current_usuario.id, running: true).first_or_create
		
		# # #  do
		# # # 	tag("label")
		# # # 	tag("input", value: @task.actual_time.to_s, class: "time")
		# # # end
		# # html = []
		# # html << "<div> #{@task.name}</div>"
		if !@tasktimer.blank?
			time =  Time.zone.now - @tasktimer.updated_at.localtime # - 5.hour# - 18000 - Time.now
			time = Time.new(2013,1) + time
			stime = time.strftime "%H:%M:%S"
			#hhmmss
			#75000 = 8hr50min
			#.strftime "%Y-%m-%d"

			content_tag(:div, class: "timermenu") do
				content_tag(:label, link_to("Running task: " + @tasktimer.name.to_s + " - Time: ", project_task_path(@tasktimer.project_id, @tasktimer.id))) +
				content_tag(:input, '', id: "tasktimervalue", value: stime) +
				content_tag(:span, 'min')
			end
		end
	end
end
