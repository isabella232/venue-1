class PaymentsController < ApplicationController
  def new
    @order = Order.find(session[:order_id])
  end

  def create
    begin
      order = Order.find(session[:order_id])
      customers = Stripe::Customer.list(limit: 1, email: order.user.email)

      customer = if customers.data.empty?
                  Stripe::Customer.create(
                    email: order.user.email,
                    source: params[:stripeToken],
                    description: 'Venue fan'
                    )
                  else
                    Stripe::Customer.retrieve(customers.data.first.id)
                  end

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: (order.total * 100).to_i,
        description: 'Venue tickets',
        currency: 'sek'
      )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path and return
    end

    if charge.paid?
      order.state = :paid
      session.delete(:order_id)
      @message = 'You rock!'
    else
      @message = 'We could not process your payment!'
    end

    redirect_back(fallback_location: root_path, notice: @message)
  end
end
