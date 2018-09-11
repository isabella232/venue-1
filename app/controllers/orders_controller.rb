class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
        order = Order.create(user: current_user)
        ticket = Ticket.find(params[:ticket_id])
        if order.add(ticket, ticket.price)
            @message = "Your ticket has been added to your order."
        else 
            @message = "Something went wrong. Please try again."
        end
    end
end
