class ApplicationController < ActionController::Base
    before_action :require_login, except: [:home]
    helper_method :logged_in?, :current_trainer
    
    # GET '/' - Application Homepage
    def home
        if !logged_in? 
            nil 
        else  
            @trainer = Trainer.find_by_id(session[:user])
            @training_sessions = TrainingSession.all.where(:trainer_id => current_trainer)
        end
    end

    private 

    def sign_in(user)
        reset_session
        session[:user] = user.id
    end

    def sign_out(user)
        session[:user].destroy
        redirect_to '/home'
    end

    def current_trainer
        @current_trainer ||= Trainer.find_by_id(session[:user])
    end

    def logged_in?
        current_trainer != nil
    end
    
    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path
        end
    end
end
