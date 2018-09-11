class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create
        @order = Order.create
        @ticket = Ticket.find(1)

        @order.add(@ticket, @ticket.price)
    end
end
