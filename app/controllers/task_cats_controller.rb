class TaskCatsController < ApplicationController
	before_filter :require_admin
  before_action :set_task_cat, only: [:show, :edit, :update, :destroy]

  def index
    @task_cats = TaskCat.all
  end

  def show
  end

  def new
    @task_cat = TaskCat.new
  end

  def edit
  end

  def create 
    @task_cat = TaskCat.new(task_cat_params)

    respond_to do |format|
      if @task_cat.save
        format.html { redirect_to task_cats_path, notice: 'Task category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task_cat }
      else
        format.html { render action: 'new' }
        format.json { render json: @task_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task_cat.update(task_cat_params)
        format.html { redirect_to task_cats_path, notice: 'Task category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task_cat.destroy
    respond_to do |format|
      format.html { redirect_to task_cats_url }
      format.json { head :no_content }
    end
  end


  private
    def set_task_cat
      @task_cat = TaskCat.find(params[:id])
    end

    def task_cat_params
      params.require(:task_cat).permit(:name)
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
