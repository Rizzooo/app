class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]
    # GET '/login' - Login Form
    def new
        @trainer = Trainer.new
    end

    # POST '/sessions' - Login Trainer & Redirect
    def create
        trainer = Trainer.find_by(:email => params[:trainer][:email])

        if trainer && trainer.authenticate(params[:trainer][:password])
            flash[:notice] = "Login Successful!"
            sign_in(trainer)
            redirect_to trainer_path(trainer)
        else  
            flash[:notice] = "Login Failed. Please try again."
            redirect_to "/login"
        end
    end

    # DELETE '/sessions/:id' - Logout
    def destroy
    end
end
