class TaskCatsController < ApplicationController
	before_filter :require_admin

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  	def require_admin
      if current_usuario      
        if current_usuario.admin?
          true
        else
          redirect_to root_path(), flash: { notice: "you don't have permission to access."}
        end
      end
    end

end
