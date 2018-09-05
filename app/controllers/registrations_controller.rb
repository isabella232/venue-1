class RegistrationsController < Devise::RegistrationsController
    respond_to :js 

    def new
        super
    end

    def create 
        binding.pry
        super
    end

end