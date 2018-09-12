module OrdersService
  def self.add_ticket_to_order(ticket, order)
    
    message = if order.add(ticket, ticket.price)
                'Your ticket has been added to your order.'
              else
                'Something went wrong. Please try again.'
              end
    message
  end
end
