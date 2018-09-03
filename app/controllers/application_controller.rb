class ApplicationController < ActionController::Base

    def index
        # This is a TMP index page
        @entries = ['This Band That We Love', 'Another Band', 'Amy Lee', 'Some Other']
    end
end
