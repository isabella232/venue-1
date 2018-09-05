class ApplicationController < ActionController::Base
    before_action :get_slider_content
    
    def index
        # This is a TMP index page
    end

    private 
    def get_slider_content 
        @entries = ['This Band That We Love', 'Another Band', 'Amy Lee', 'Some Other']
    end
end
