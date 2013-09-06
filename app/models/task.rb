class Task < ActiveRecord::Base
	belongs_to :project
	has_many :task_histories

	# def to_param
	# 	#{}"#{id}-#{name}"	
	# 	name.downcase.gsub(/\s+/, '-')
	# end
end
