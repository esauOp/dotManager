class CalendarController < ApplicationController
  def index
  	@tasks = Task.where('date_ini BETWEEN ? AND ?', DateTime.now.in_time_zone.beginning_of_month, DateTime.now.in_time_zone.end_of_month)
  	#@date = params[:month] ? Date.parse(params[:month]) : Date.today

  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
      format.js  { render :json => @tasks }
    end
  end
end
