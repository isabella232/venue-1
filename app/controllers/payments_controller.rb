# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    @order = Order.find(session[:order_id])
  end

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10000,
      description: 'Venue tickets',
      currency: 'sek'
    )
      if charge.paid?
        @message = 'You rock!'
      else
        @message = 'You rock!'
      end
  end
end
