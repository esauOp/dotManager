class Task < ActiveRecord::Base
	belongs_to :project
	has_many :task_histories

	# def to_param
	# 	#{}"#{id}-#{name}"	
	# 	name.downcase.gsub(/\s+/, '-')
	# end
	def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :description => self.description || "",
      :start => date_ini.rfc822,
      :end => date_end.rfc822,
      :allDay => true,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.project_task_path(self.project_id, self.id)
    }
    
  end
end
