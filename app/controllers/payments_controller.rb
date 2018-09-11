# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    @order = Order.find(session[:order_id])
  end

  def create
    order = Order.find(session[:order_id])
    customer = Stripe::Customer.create(
      email: order.user.email,
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (order.total * 100).to_i,
      description: 'Venue tickets',
      currency: 'sek'
    )
    if charge.paid?
      order.state = :paid
      # Lover the stock of available tickets
      session.delete(:order_id)
      message = 'You rock!'
    else
      message = "We could not process your payment!"
    end

    redirect_back(fallback_location: root_path, notice: message)
  end
end
