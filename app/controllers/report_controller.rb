class ReportController < ApplicationController
	def index
	  	#@tasks = Task.where('(true = ? OR assignee_id = ?) AND date_ini BETWEEN ? AND ?', current_usuario.admin, current_usuario.id, DateTime.now.beginning_of_month, DateTime.now.in_time_zone.end_of_month)
	  	@tasks = Task.where('(? in (usuario_id, 0)) ', params[:assignee][:id])
	  	#@date = params[:month] ? Date.parse(params[:month]) : Date.today
	  
	  	respond_to do |format|
	      format.html
	      format.csv  { send_data @tasks.as_csv }
	      format.xls  #{ send_data @projects.as_csv(col_sep: "\t") }
	    end
	end
end
