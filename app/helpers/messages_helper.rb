module MessagesHelper
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            log_in user
            @current_user = user
        end
    end
    
    def admin_user?
        if logged_in?
            current_user.admin == true
        end
    end
end
