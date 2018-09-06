class PerformersController < ApplicationController
    respond_to :js
    before_action :authenticate_user!, only: [:create]

    def create
        @performer = current_user.create(performer_params)
        if @performer.persisted?
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def performer_params
        params.require(:performer).permit(:name, :genre, :city, :description)
    end
end
