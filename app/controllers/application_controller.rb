class ApplicationController < ActionController::Base

  helper :all
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation
  
  before_filter :check_authentication
  before_filter :instantiate_controller_and_action_names
  add_crumb "Úvod", '/'
  
  private
    
    def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def check_authentication
      unless current_user
        store_location
        flash[:error] = "Musíte se přihlásit pro přístup na tuto stránku."
        redirect_to new_user_session_url
        return false
      end  
    end   
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
end