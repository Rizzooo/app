class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :require_login, except: [:home]
    helper_method :logged_in?, :current_trainer
    
    # GET '/' - Application Homepage
    def home
        if !logged_in? 
            render 'home'
        else  
            @trainer = Trainer.find_by_id(session[:user])
            @training_sessions = TrainingSession.upcoming_sessions
        end
    end

    private # Move helpers to /helpers/application_helper.rb

    # def sign_in(user)
    #     reset_session
    #     session[:user] = user
    # end

    # def sign_out(user)
    #     session[:user].destroy
    #     redirect_to '/home'
    # end

    # def current_trainer
    #     @current_trainer ||= Trainer.find_by_id(session[:user])
    # end

    # def logged_in?
    #     current_trainer != nil
    # end
    
    # def require_login
    #     unless logged_in?
    #       flash[:error] = "You must be logged in to access this section"
    #       redirect_to login_path
    #     end
    # end
end
