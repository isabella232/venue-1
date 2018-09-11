class RegistrationsController < Devise::RegistrationsController
    respond_to :js 

    def new 
        if params[:panel] == 'choice'
            render 'choice'
        else
            @role = params[:role] || 'fan'
            build_resource
            #yield resource if block_given?
            #respond_with resource

        end
    end
    def create 
        build_resource(sign_up_params)
        if resource.save
            flash[:notice] = 'Welcome! You have signed up successfully.'
            sign_up(resource_name, resource)
            session[:after_sign_up_path] = after_sign_in_path_for(resource)
        else
            errors = resource.errors.full_messages
            render json: {message: errors}, status: 422
        end
    end

end