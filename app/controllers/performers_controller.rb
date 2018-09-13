class PerformersController < ApplicationController
    respond_to :js
    before_action :authenticate_user!, only: [:create]
    before_action :get_performer, only: [:show, :edit, :update]

    def index
        @performers = if user_signed_in? && current_user.admin?
                        Performer.all
                      else
                        Performer.with_state(:active)
                      end
    end
    
    def new
        @performer = Performer.new
        authorize @performer
    end
    
    def create
        authorize Performer.create
        @performer = current_user.performers.create(performer_params)
        if @performer.persisted?
            flash[:notice] = 'Artist page successfully created'
            redirect_to performer_path(@performer)
        else
            render json: {message: "Additional input required"}, status: 422
        end
    end

    def show
    end

    def edit
        authorize @performer
    end

    def update
        if params[:event] == 'archive'
            @performer.archive
            redirect_to performers_path, notice: 'Performer has been archived'
        else
            @performer.update_attributes(performer_params)
            redirect_to performer_path(@performer), notice: 'Profile has been successfully updated'
            authorize @performer
        end
    end

    private

    def performer_params
        params.require(:performer).permit(
            :name,
            :city,
            :description,
            :facebook,
            :instagram,
            :twitter,
            :youtube,
            :website,
            :spotify,
            :state,
            genre_ids: []
        )
    end

    def get_performer
        @performer = Performer.find(params[:id])
    end
end
