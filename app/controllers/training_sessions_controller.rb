class TrainingSessionsController < ApplicationController
    include ApplicationHelper
    # GET '/training_sessions/new' - New Client Form
    # POST '/training_sessions' - Create New Client & Redirect 

    # Try Trainer or current_trainer.build()
    def new
        @training_session = TrainingSession.new
        # byebug
    end

    def create 
        # training_session.trainer_id = current_trainer.id
        training_session = TrainingSession.create(training_session_params)
        # byebug

        if training_session.valid?
            flash[:notice] = "Training Session successfully created!"
            sign_in(training_session)
            # byebug
            redirect_to training_session_path(training_session.id)
        else  
            flash[:notice] = "Training Session creation failed. Please, try again."
            redirect_to new_training_session_path
        end
    end

    # GET '/training_sessions' - Training Sessions Index
    def index
        @training_sessions = TrainingSession.upcoming_sessions
    end

    # GET '/training_sessions/:id' - Training Sessions Show Page
    def show
        @training_session = TrainingSession.find_by_id(params[:id])
        # byebug
        # @current_time = Time.now.strftime("%I:%M:%S %Z")
        # @default_end_time = (@current_time.to_time + 1.hours).to_datetime
    end

    # GET '/training_sessions/:id/edit' - Training Sessions Edit Page
    # PATCH '/training_sessions/:id' - Edit TS, Save and Redirect
    def edit
        @training_session = TrainingSession.find_by_id(params[:id])
    end

    def update
        training_session = TrainingSession.find_by_id(params[:id])

        if training_session
            training_session.update(training_session_params)
                if training_session.valid?
                    training_session.save
                    redirect_to training_session_path(training_session)
                else  
                    flash[:notice] = "Trainer Invalid. Please try again."
                    redirect_to edit_training_session_path(training_session)
                end
        else 
            flash[:notice] = "Must be logged in."
            redirect_to '/home'
        end
    end

    # DELETE '/training_sessions/:id' - Delere Training Sessions and Redirect
    def destroy
        training_session = TrainingSession.find_by_id(params[:id])

        training_session.destroy 
        redirect_to '/home'
    end

    private

    def training_session_params
        params.require(:training_session).permit(:client_id, :start_time, :end_time, :notes)
    end
end
