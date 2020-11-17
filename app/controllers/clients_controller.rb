class ClientsController < ApplicationController
    def new
    end

    def index
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def client_params
        params.require(:client).permit(:name, :email, :height, :weight, :goals)
    end
end
