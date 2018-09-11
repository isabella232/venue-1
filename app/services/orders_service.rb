# frozen_string_literal: true

module OrdersService
  def self.add_ticket(ticket, current_user)
    order = Order.create(user: current_user)
    message = if order.add(ticket, ticket.price)
                'Your ticket has been added to your order.'
              else
                'Something went wrong. Please try again.'
              end
    message
  end
end
