class ClientsController < ApplicationController
    # GET '/clients/new' - New Client Form
    # POST '/clients' - Create New Client & Redirect 
    def new
    end

    def create  
    end

    # GET '/clients' - Clients Index, All Clients
    def index
        @clients = Client.all
    end

    #GET '/clients/:id' - Clients Show Page
    def show
    end

    # GET '/clients/:id/edit' - Edit Client Form
    def edit
    end

    # PATCH 'clients/:id' - Update Client, Save, & Redirect
    def update
    end

    # DELETE 'clients/:id' - Delete Client, & Redirect
    def destroy
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :height, :weight, :goals)
    end
end
