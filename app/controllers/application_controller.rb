class ApplicationController < ActionController::Base	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_usuario!
#   before_filter :is_admin?

# private	  
# 	def is_admin?
# 		if current_usuario			
# 		  if current_usuario.admin?
# 		    true
# 		  else
# 		    render :text => 'Who are you to doing this? :)'
# 		  end
# 		end
# 	end
end
