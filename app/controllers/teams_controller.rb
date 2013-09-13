class TeamsController < ApplicationController
  before_filter :require_admin
  before_action :set_team, only: [:edit, :update, :destroy]

  def index
  	@teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
  	@team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @team = Team.new(team_params)
    #@team = Team.new(params[:team].permit(:name, :description))
    #@blog_post = BlogPost.new(:title => params[:blog_post][:title], :content => params[:blog_post][:content])

    respond_to do |format|
      if @team.save
        flash[:notice] = 'Team was successfully created.'
        format.html {redirect_to(teams_path)}
      else
        format.html {render "new"}
      end

    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_path }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to teams_path, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
      end
    end
  end


private
  def team_params
    params.require(:team).permit(:name, :description, :usuario_ids => [])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def require_admin
      if current_usuario      
        if current_usuario.admin?
          true
        else
          redirect_to root_path(), flash: { alert: "You don't have permission to access."}
        end
      end
    end
end
