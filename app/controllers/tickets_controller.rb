class TicketsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def new
        @ticket = Ticket.new
        authorize @ticket
    end
    
    def create
        @ticket = current_user.tickets.create(ticket_params)
        if @ticket.persisted?
        redirect_to campaign_path(@campaign)
        else
        render json: {message: "Additional input required"}, status: 422
        end
    end

    def show
        @ticket = Ticket.find(params[:id])
    end

    private 

    def ticket_params
        params.require(:ticket).permit(:price, :name)
    end
end
