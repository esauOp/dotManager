class DashboardController < ApplicationController
  def index
  	# if !current_usuario
  	# 	redirect_to(new_usuario_session_path)
  	# end

  	if current_usuario.admin      
      @tasks = Task.all.limit(20)
    else
    #@projects = Project.all(:include => :usuarios, :conditions => ["usuarios.id = ?", current_usuario.id])     
      @tasks = Task.where('(? = usuario_id ) ', current_usuario.id ).order("id ASC").limit(10)
      #Task.includes(:usuarios).where(usuarios: { id:current_usuario.id })
    end

    respond_to do |format|
      format.html
      #format.csv  { send_data @tasks.as_csv }
      #format.xls  #{ send_data @projects.as_csv(col_sep: "\t") }
    end
  end
end
