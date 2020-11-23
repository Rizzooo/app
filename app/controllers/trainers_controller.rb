class TrainersController < ApplicationController
    include ApplicationHelper
    # skip_before_action :verify_authenticity_token
    skip_before_action :require_login, only: [:new, :create]
    
    # GET '/signup' (trainers#new) - New Trainer Form
    # POST '/trainers' - Create New Client & Redirect
    def new
        @trainer = Trainer.new
    end

    def create
        trainer = Trainer.create!(trainer_params)
        # byebug

        if trainer && trainer.valid?
            flash[:notice] = "Account successfully created!"
            sign_in(trainer)
            # byebug
            redirect_to trainer_path(trainer)
        else  
            flash[:notice] = "Account creation failed. Please, try again."
            redirect_to new_trainer_path
        end
    end

    #GET '/trainers/:id' - Trainers Show Page
    def show
        @trainer = current_trainer
        @training_sessions = TrainingSession.all.where(trainer_id: session[:user_id])
        byebug
    end

    # GET '/account' - Trainer Account Page
    def account
        @trainer = Trainer.find_by_id(session[:user])
    end

    # GET '/trainers/:id/edit' - Edit Trainer Form
    def edit
        @trainer = Trainer.find_by_id(session[:user])
        byebug
    end

    # PATCH 'trainers/:id' - Update Trainer, Save, & Redirect
    def update
        trainer = Trainer.find_by_id(session[:user])

        if trainer
            trainer.update(trainer_params)
                if trainer.valid?
                    trainer.save
                    redirect_to trainer_path(trainer.id)
                else  
                    flash[:notice] = "Trainer Invalid. Please try again."
                    redirect_to edit_trainer_path(trainer.id)
                end
        else 
            flash[:notice] = "Must be logged in."
            redirect_to '/home'
        end
    end

    def account 
        @trainer = Trainer.find_by_id(session[:user])
    end

    # DELETE 'trainers/:id' - Delete Trainer (Account!), & Redirect
    def destroy
        trainer = Trainer.find_by_id(session[:user])

        trainer.destroy
        # byebug
        redirect_to '/login'
    end

    private

    def trainer_params
        params.require(:trainer).permit(:name, :email, :password, :specialty)
    end

end
