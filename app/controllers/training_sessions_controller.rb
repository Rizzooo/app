class TrainingSessionsController < ApplicationController
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

    def training_session_params
        params.require(:training_session).permit(:name, :email, :height, :weight, :goals)
    end
end
