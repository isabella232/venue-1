class ApplicationController < ActionController::Base
    before_action :get_slider_content

    def after_sign_in_path_for(resource_or_scope)
        super
    end

        
    
    private 
    def get_slider_content 
        @entries = ['This Band That We Love', 'Another Band', 'Amy Lee', 'Some Other']
    end
end
