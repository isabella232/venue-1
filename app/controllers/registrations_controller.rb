class RegistrationsController < Devise::RegistrationsController
    respond_to :js 

    def new 
        if params[:panel] == 'choice'

            render 'choice'
        else
            super
        end
    end
    def create 
        build_resource(sign_up_params)
        if resource.save
            flash[:notice] = 'Welcome! You have signed up successfully.'
            sign_up(resource_name, resource)
            redirect_to root_path
        else
            errors = resource.errors.full_messages
            render json: {message: errors}, status: 422
        end
    end

end