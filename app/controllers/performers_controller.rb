class PerformersController < ApplicationController
    respond_to :js
    before_action :authenticate_user!, only: [:create]

    def index
        if user_signed_in? && current_user.admin?
            @performers = Performer.all
        else
            @performers = Performer.with_state(:active)
        end
    end
    
    def new
        @performer = Performer.new
        authorize @performer
    end
    
    def create
        @performer = current_user.performers.create(performer_params)
        if @performer.persisted?
            flash[:notice] = 'Artist page successfully created'
            redirect_to performer_path(@performer)
        else
            render json: {message: "Additional input required"}, status: 422
        end
        authorize @performer
    end

    def show
        @performer = Performer.find(params[:id])
    end

    def edit
        @performer = Performer.find(params[:id])
        authorize @performer
    end

    def update
        if params[:event] == 'archive'
            performer = Performer.find(params[:id])
            performer.archive
            redirect_to performers_path, notice: 'Performer has been archived'
        else
            @performer = Performer.find(params[:id])
            @performer.update_attributes(performer_params)
            redirect_to performer_path(@performer), notice: 'Profile has been successfullu updated'
            authorize @performer
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
            :spotify,
            :state
            )
    end
end
