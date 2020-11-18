class TrainingSessionsController < ApplicationController
    # GET '/training_sessions/new' - New Client Form
    # POST '/training_sessions' - Create New Client & Redirect 
    def new
    end

    def create 
    end

    # GET '/training_sessions' - Training Sessions Index
    def index
    end

    # GET '/training_sessions/:id' - Training Sessions Show Page
    def show
    end

    # GET '/training_sessions/:id/edit' - Training Sessions Edit Page
    # PATCH '/training_sessions/:id' - Edit TS, Save and Redirect
    def edit
    end

    def update
    end

    # DELETE '/training_sessions/:id' - Delere Training Sessions and Redirect
    def destroy
    end

    private

    def training_session_params
        params.require(:training_session).permit(:name, :email, :height, :weight, :goals)
    end
end
