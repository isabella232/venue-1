class RegistrationsController < Devise::RegistrationsController
    respond_to :js 

    def create 
        build_resource(sign_up_params)
        resource.save
        if resource.persisted?
            flash[:notice] = 'Welcome! You have signed up successfully.'
            sign_up(resource_name, resource)
            render js: "Turbolinks.visit(Turbolinks.absoluteURL, {action: 'reload'})"
        else
            errors = resource.errors.full_messages
            render json: {message: errors}, status: 422
        end
    end

end