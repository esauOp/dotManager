class Project < ActiveRecord::Base
	has_many :tasks, :order => "id DESC", dependent: :destroy
	belongs_to :cliente
	# belongs_to :usuario
	has_and_belongs_to_many :usuarios	
end
