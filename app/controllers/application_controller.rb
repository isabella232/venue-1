class ApplicationController < ActionController::Base
    before_action :get_slider_content
    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource_or_scope)
        super
    end

        
    
    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :access_denied

    private 
    
    def access_denied
        redirect_to root_path, notice: 'Access denied'
    end

    def get_slider_content 
        @entries = ['This Band That We Love', 'Another Band', 'Amy Lee', 'Some Other']
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end
end
