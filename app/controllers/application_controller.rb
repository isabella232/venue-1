class ApplicationController < ActionController::Base
    before_action :get_slider_content
    
    private 
    def get_slider_content 
        @entries = ['This Band That We Love', 'Another Band', 'Amy Lee', 'Some Other']
    end
end
