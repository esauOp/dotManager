class ClientesController < ApplicationController
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
        format.html { redirect_to @cliente, notice: 'Client was successfully created.' }        
      else
        format.html { render action: 'new' }        
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def client_params
      params.require(:cliente).permit(:name, :adress, :city, :state, :zip)
    end
end
