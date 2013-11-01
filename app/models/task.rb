class Task < ActiveRecord::Base
	belongs_to :project
	has_many :task_histories
  has_many :task_comments

	# def to_param
	# 	#{}"#{id}-#{name}"	
	# 	name.downcase.gsub(/\s+/, '-')
	# end
	def as_json(options = {})
    {
      :id => self.id,
      :title => self.name,
      :description => self.description || "",
      :start => date_ini,
      :end => date_end,
      :allDay => true,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.task_path(self.id)
    }
    
  end
end
