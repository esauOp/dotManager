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

  private
    def task_params
      params.require(:task).permit(:name, :date_ini, :date_end, :milestone, :estimated_time, :description, :task_status_id, :task_cat_id, :task_priority_id, :assignee_id )
    end
end
