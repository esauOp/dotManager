class Cliente < ActiveRecord::Base
	#Relaciones
	has_many :projects #, dependent: :destroy	
end
