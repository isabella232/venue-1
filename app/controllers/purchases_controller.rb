class PurchaseController < ApplicationController

  def create_ticket
    user = User.find(params[:user_id])
    customer = Stripe::Customer.create(email: user.email, source: params['stripeToken'])
    charge = Stripe::Charge.create(customer: customer.id, amount: (10 * 100), description: 'Venue Ticket', currency: 'sek')
    if charge.paid?
        ticket.created
        flash[:notice] = 'Your Ticket has been booked!'
      else
        flash[:error] = 'Could not subscribe to D-pressed'
    end
    redirect_back(fallback_location: root_path)
  end


  def new
  end
end
