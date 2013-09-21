class TaskComment < ActiveRecord::Base
	belongs_to :task
	belongs_to :usuario
	has_many :replies

end
