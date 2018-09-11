class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:create]

    def create
        order = Order.create(user: current_user)
        ticket = Ticket.find(params[:ticket_id])
        order.add(ticket, ticket.price)
        flash[:notice] = "Your ticket has been added to your order."
        #render json: {message: "Your ticket has been added to your order."}
    end
end
