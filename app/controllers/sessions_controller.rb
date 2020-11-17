class SessionsController < ApplicationController
    def new
        @user = Trainer.new
    end

    def create
        trainer = Trainer.find_by(:email => params[:trainer][:id])

        if trainer && trainer.authenticate(params[:trainer][:password])
            flash[:notice] = "Login Successful!"
            session[:user_id] = trainer.id
            redirect_to trainer_path(trainer)
        else  
            flash[:notice] = "Login Failed. Please try again."
            redirect_to "/login"
        end
    end

    def destroy
    end
end
