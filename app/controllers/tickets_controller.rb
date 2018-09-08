class TicketsController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def new
        @ticket = Ticket.new
        authorize @ticket
    end
    


    def show
        @ticket = Ticket.find(params[:id])
    end

    private 

    def tickets_params
        params.require(:ticket).permit(:price, :name)
    end
end
