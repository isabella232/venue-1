class ApplicationController < ActionController::Base
    before_action :get_slider_content
    
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
end
