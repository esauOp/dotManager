class TeamsController < ApplicationController
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
        format.html {redirect_to(root_path)}
      else
        format.html {render "new"}
      end

    end
  end

  def edit
  end

private
  def team_params
    params.require(:team).permit(:name, :description, :usuario_ids => [])
  end
end
