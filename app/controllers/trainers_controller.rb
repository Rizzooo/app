class TrainersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    # GET '/signup' (trainers#new) - New Trainer Form
    # POST '/trainers' - Create New Client & Redirect
    def new
        @trainer = Trainer.new
    end

    def create
        trainer = Trainer.create(trainer_params)
        # byebug

        if trainer.valid?
            flash[:notice] = "Account successfully created!"
            sign_in(trainer)
            redirect_to trainer_path(trainer.id)
        else  
            flash[:notice] = "Account creation failed. Please, try again."
            redirect_to new_trainer_path
        end
    end

    #GET '/trainers/:id' - Trainers Show Page
    def show
        @trainer = Trainer.find_by_id(session[:user])
    end

    # GET '/trainers/:id/edit' - Edit Trainer Form
    def edit
    end

    # PATCH 'trainers/:id' - Update Trainer, Save, & Redirect
    def update
    end

    # DELETE 'trainers/:id' - Delete Trainer (Account!), & Redirect
    def destroy
    end

    private

    def trainer_params
        params.require(:trainer).permit(:name, :email, :password, :specialty)
    end

end
