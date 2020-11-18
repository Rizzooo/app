class ApplicationController < ActionController::Base
    before_action :require_login, except: [:home]
    # helper_method :logged_in?, :current_user
    
    # GET '/' - Application Homepage
    def home
    end

    private 

    def sign_in(user)
        session[:user] = user.id
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
