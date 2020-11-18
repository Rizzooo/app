class TrainingSessionsController < ApplicationController
    # GET '/training_sessions/new' - New Client Form
    # POST '/training_sessions' - Create New Client & Redirect 
    def new
        @training_session = TrainingSession.new
    end

    def create 
        training_session = TrainingSession.create(training_session_params)
        # byebug

        if training_session.valid?
            flash[:notice] = "Account successfully created!"
            sign_in(training_session)
            redirect_to training_session_path(training_session.id)
        else  
            flash[:notice] = "Account creation failed. Please, try again."
            redirect_to new_training_session_path
        end
    end

    # GET '/training_sessions' - Training Sessions Index
    def index
        @training_sessions = TrainingSession.all
    end

    # GET '/training_sessions/:id' - Training Sessions Show Page
    def show
        @training_session = TrainingSession.find_by_id(params[:training_session][:id])
    end

    # GET '/training_sessions/:id/edit' - Training Sessions Edit Page
    # PATCH '/training_sessions/:id' - Edit TS, Save and Redirect
    def edit
        @training_session = TrainingSession.find_by_id(params[:training_session][:id])
    end

    def update
        training_session = TrainingSession.find_by_id(params[:training_session][:id])

        if training_session
            training_session.update(training_session_params)
                if training_session.valid?
                    training_session.save
                    redirect_to trainer_path(training_session.id)
                else  
                    flash[:notice] = "Trainer Invalid. Please try again."
                    redirect_to edit_trainer_path(training_session.id)
                end
        else 
            flash[:notice] = "Must be logged in."
            redirect_to '/home'
        end
    end

    # DELETE '/training_sessions/:id' - Delere Training Sessions and Redirect
    def destroy
        training_session = TrainingSession.find_by_id(params[:training_session][:id])

        training_session.destroy 
        redirect_to '/home'
    end

    private

    def training_session_params
        params.require(:training_session).permit(:name, :email, :height, :weight, :goals)
    end
end
