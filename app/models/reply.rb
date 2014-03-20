class Reply < ActiveRecord::Base
	belongs_to :task_comment
	belongs_to :usuario
end
