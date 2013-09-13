class ClientesController < ApplicationController
  before_filter :require_admin
  before_action :set_cliente, only: [:edit, :update, :destroy]

  def index
    @clientes = Cliente.all
  end

  def show
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(client_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to clientes_path, notice: 'Client was successfully created.' }        
      else
        format.html { render action: 'new' }        
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cliente.update(client_params)
        format.html { redirect_to clientes_path, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_path }
      format.json { head :no_content }
    end
  end

  private
    def client_params
      params.require(:cliente).permit(:name, :adress, :city, :state, :zip)
    end

    def set_cliente
      @cliente = Cliente.find(params[:id])
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
