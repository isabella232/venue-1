class OrdersController < ApplicationController
  # before_action :authenticate_user!, only: [:create]

  def create
    ticket = Ticket.find(params[:ticket_id])
    if current_user
      @message = OrdersService.add_ticket(ticket, current_user)
    else
      session[:ticket_id] = ticket.id
      @role = 'fan'  
      render 'devise/registrations/new'
    end
  end
end
