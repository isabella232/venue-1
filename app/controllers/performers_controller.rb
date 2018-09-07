class PerformersController < ApplicationController
    respond_to :js
    before_action :authenticate_user!, only: [:create]

    def new
        @performer = Performer.new
    end
    
    def create
        @performer = Performer.create(performer_params)
        if @performer.persisted?
            redirect_to root_path
        else
            flash[:error] = "Required field can't be empty."
            render :_form
        end
    end

    private

    def performer_params
        params.require(:performer).permit(
            :name,
            :genre,
            :city,
            :description,
            :facebook,
            :instagram,
            :twitter,
            :youtube,
            :website,
            :spotify
            )
    end
end
