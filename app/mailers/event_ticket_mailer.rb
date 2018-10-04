class EventTicketMailer < ApplicationMailer
    def deliver_ticket
        @user = params[:user]
        mail(to: @user.email, subject: "Here's your Ticket!")
    end 
end
