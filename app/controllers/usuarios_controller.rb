class UsuariosController < ApplicationController
  before_filter :require_admin

  def index
  	@usuarios = Usuario.all
  end

  def show
  end

  def new
  	@usuario = Usuario.new
  	# @team = Team.new    
  end

  def edit
  end

  def create
    # if params[:usuario][:password].blank?
    #   params[:usuario].delete(:password)
    #   params[:usuario].delete(:password_confirmation)
    # end

  	@usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'User was successfully created.'
        format.html {redirect_to(root_path)}
      else
        format.html {render "new"}
      end

    end  	
  end	

  private
   def usuario_params
      params.require(:usuario).permit(:name, :last_name, :password, :email, :admin)
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
