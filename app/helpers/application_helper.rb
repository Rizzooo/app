module ApplicationHelper
    def sign_in(user)
        session[:user_id] = user.id
    end

    def sign_out(user)
        session[:user].destroy
        redirect_to '/home'
    end

    def current_trainer
        current_trainer ||= Trainer.find_by_id(session[:user_id])
        # current_trainer
        # byebug
    end

    def logged_in?
        current_trainer != nil
    end
    
    def require_login
        if !logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path
        end
    end
end
