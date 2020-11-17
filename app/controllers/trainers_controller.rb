class TrainersController < ApplicationController
    def new
        @trainer = Trainer.new
    end

    def create
        trainer = Trainer.create(trainer_params)

        if trainer.valid?
            flash[:notice] = "Account successfully created!"
            session[:user_id] = trainer.id
            redirect_to trainer_path(trainer)
        else  
            flash[:notice] = "Account creation failed. Please, try again."
            redirect_to new_trainer_path
        end
    end

    def show
        @trainer = Trainer.find_by(:id => session[:user_id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def trainer_params
        params.require(:trainer).permit(:name, :email, :password, :specialty)
    end

end
