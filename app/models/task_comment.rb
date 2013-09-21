class TaskComment < ActiveRecord::Base
	belongs_to :task
	belongs_to :usuario
end
