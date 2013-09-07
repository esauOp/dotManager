class TasksController < ApplicationController
  def index
  end

  def new  	  	
    @project = Project.find(params[:project_id])
    @task = Task.new
  end

  def show
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  def edit
  end

  def create
  	@project = Project.find(params[:project_id])
    #@comment = @blog_post.comments.build(params[:comment])
    @task = @project.tasks.create(task_params)

    if @task.save
      redirect_to project_path(@project_path), flash: { notice: 'Your task was asigned.'}
    else
      redirect_to project_path(@project_path), flash: { error: 'Failes to post your comment, ja!'}
    end   
  end

  def run_stop
    @task = Task.find(params[:id])
    if @task.running?
      @task.running = false

      @taskhistory = TaskHistory.where(task_id: @task.id, version: @task.version).first_or_create
      @taskhistory.time = @taskhistory.time.to_f + 1

      @task.actual_time = @task.actual_time.to_f + @taskhistory.time.to_f

      @taskhistory.update_attributes(:time => @taskhistory.time)
    else
      @task.running = true
      @task.version = @task.version.to_i + 1

      @taskhistory = TaskHistory.new
      @taskhistory.task_id = @task.id
      @taskhistory.version = @task.version
      @taskhistory.time = 0

      @taskhistory.save
    end

    if @task.update_attributes(:actual_time => @task.actual_time, :running => @task.running, :version => @task.version)
      redirect_to project_task_path(@task.project_id, @task.id), flash: {notice: 'Task clicked!.'}
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

    # def run_params
    #   params.require(:task).permit(:running)
    # end
end
