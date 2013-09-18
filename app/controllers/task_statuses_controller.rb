class TaskStatusesController < ApplicationController
	before_filter :require_admin
  before_action :set_task_status, only: [:show, :edit, :update, :destroy]

  def index
    @task_statuses=TaskStatus.all
  end

  def show
  end

  def new
    @task_status = TaskStatus.new
  end

  def edit
  end

  def create
    @task_status = TaskStatus.new(task_status_params)

    respond_to do |format|
      if @task_status.save
        format.html { redirect_to task_statuses_path, notice: 'Task status was successfully created.' }
        format.json { render action: 'show', status: :created, location: task_status_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @task_status.update(task_status_params)
        format.html { redirect_to task_statuses_path, notice: 'Task status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_status.destroy
    respond_to do |format|
      format.html { redirect_to task_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    def set_task_status
      @task_status = TaskStatus.find(params[:id])      
    end

    def task_status_params
      params.require(:task_status).permit(:name)
    end

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
