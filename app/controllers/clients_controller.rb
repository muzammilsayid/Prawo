class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      flash[:notice] = "Client #{@client.name} created successfully."
      redirect_to @client
    else
      render 'new'
    end
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      flash[:notice] = "Client #{@client.name} updated successfully."
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    flash[:notice] = "Client #{@client.name} deleted successfully."
    redirect_to clients_path
  end

  ### Private Methods
  private
    def client_params
      params.require(:client).permit(:name, :father_name, :phone, :email, :date_of_birth, :address, :city, :pin_zip, :state, :country, :notes)
    end
end
