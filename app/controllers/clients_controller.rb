class ClientsController < ApplicationController
    # GET '/clients/new' - New Client Form
    # POST '/clients' - Create New Client & Redirect 
    def new
        @client = Client.new
    end

    def create  
        client = Client.create(client_params)

        if client.valid?
            flash[:notice] = "Client successfully created!"
            redirect_to client_path(client.id)
        else  
            flash[:notice] = "Client creation failed. Please, try again."
            redirect_to new_client_path
        end
    end

    # GET '/clients' - Clients Index, All Clients
    def index
        @clients = Client.all
    end

    #GET '/clients/:id' - Clients Show Page
    def show
        # byebug
        @client = Client.find_by_id(params[:id])
    end

    # GET '/clients/:id/edit' - Edit Client Form
    def edit
        @client = Client.find_by_id(params[:id])
    end

    # PATCH 'clients/:id' - Update Client, Save, & Redirect
    def update
        client = Client.find_by_id(params[:id])

        if client
            client.update(client_params)
            if client.valid?
                client.save
                flash[:notice] = "Client successfully updated!"
                redirect_to clieint_path(client.id)
            else  
                flash[:notice] = "Client Invalid. Please try again."
                redirect_to edit_client_path(client.id)
            end
        else  
            flash[:notice] = "Client creation failed. Please, try again."
            redirect_to new_client_path
        end
    end

    # DELETE 'clients/:id' - Delete Client, & Redirect
    def destroy
        client = Client.find_by_id(params[:id])
        client.destroy 
        redirect_to '/'
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :height, :weight, :goals)
    end
end
