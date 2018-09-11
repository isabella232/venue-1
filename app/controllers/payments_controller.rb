class PaymentsController < ApplicationController
  def new
    @order = Order.find(session[:order_id])
  end

  def create
    @message = "You rock!"
  end
end
