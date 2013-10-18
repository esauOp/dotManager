class TasksController < ApplicationController
  
  #before_filter :require_admin, only: [:destroy]
  before_filter :require_owner, only: [:edit, :update]
  before_action :set_task, only: [:edit, :update, :destroy]
  

  def index
  end

  def new  	  	
    @project = Project.find(params[:project_id])
    @task = Task.new    
  end

  def show
    #@project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def edit
    #@project = Project.find(params[:project_id])
  end

  def create
  	@project = Project.find(params[:project_id])
    #@comment = @blog_post.comments.build(params[:comment])
    @task = @project.tasks.create(task_params)

    @usermailed = Usuario.find(@task.assignee_id)
    @title = @task.name

    TaskMailer.notification_email(@usermailed, @title).deliver

    if @task.save
      redirect_to project_path(@project), flash: { notice: 'Your task was created.'}
    else
      redirect_to project_path(@project), flash: { error: 'Failes to save the task, ja!'}
    end   
  end

  def update
    #@project = Project.find(params[:project_id])

    if @task.update(task_params)
      redirect_to project_path(@project), flash: { notice: 'Your task was updated.'}
    else
      redirect_to project_path(@project), flash: { error: 'Failes to update the task, ja!'}
    end   
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def run_stop
    @task = Task.find(params[:id])
    if @task.running?
      @task.running = false

      @taskhistory = TaskHistory.where(task_id: @task.id, version: @task.version).first
      @taskhistory.time = (Time.zone.now - @taskhistory.created_at.localtime) / 3600 #@taskhistory.time.to_f + 1

      @task.actual_time = @task.actual_time.to_f + @taskhistory.time.to_f

      @taskhistory.update_attributes(:time => @taskhistory.time)
    else
      # @tasksupdate = Task.where(:assignee_id => current_usuario)
      # @tasksupdate.running = false
      # @tasksupdate.update_attributes(:running => @tasksupdate.running)
      # Task.update_all("running = false", "assignee_id = " + current_usuario.id.to_s)
      @lasttask = Task.where(assignee_id: current_usuario.id, running: true).first
      if !@lasttask.blank?
        @lasthistory = TaskHistory.where(task_id: @lasttask.id, version: @lasttask.version).first_or_create
        @lasthistory.time = (Time.zone.now - @lasthistory.created_at.localtime) / 3600

        @lasttask.actual_time = @lasttask.actual_time.to_f + @lasthistory.time.to_f

        @lasthistory.update_attributes(:time => @lasthistory.time)

        @lasttask.update_attributes(:actual_time => @lasttask.actual_time, :running => false)
      end

      @task.running = true
      @task.version = @task.version.to_i + 1

      @taskhistory = TaskHistory.new
      @taskhistory.task_id = @task.id
      @taskhistory.version = @task.version
      @taskhistory.time = 0

      @taskhistory.save
      
    end

    if @task.update_attributes(:actual_time => @task.actual_time, :running => @task.running, :version => @task.version)
      redirect_to project_task_path(@task.project_id, @task.id) #, flash: {notice: 'Task clicked!.'}
      #   format.html { redirect_to @task, notice: 'Product was successfully updated.' }
      #   format.json { head :no_content }
      # else
      #   format.html { render action: 'edit' }
      #   format.json { render json: @task.errors, status: :unprocessable_entity }
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :date_ini, :date_end, :milestone, :estimated_time, :description, :task_status_id, :task_cat_id, :task_priority_id, :assignee_id )
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def require_admin
      if current_usuario
        if current_usuario.admin?
          true
        else
          redirect_to root_path(), flash: { notice: "You don't have permission to do this."}
        end
      end
    end

    def require_owner
      @task = Task.find(params[:id])
      if current_usuario
        if current_usuario.admin? || @task.assignee_id == current_usuario.id
          true
        else
          redirect_to root_path, flash: { error: "You don't have permission to do this."}
        end
      end
    end

    # def run_params
    #   params.require(:task).permit(:running)
    # end
end
