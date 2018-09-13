class TicketVariant < ApplicationRecord
  belongs_to :ticket
  validates_associated :ticket

  validates_presence_of :name, :base_price_percentage

  def price 
    self.ticket.price * self.base_price_percentage
  end

  def count
    (self.ticket.price * 0.33).round.to_i
  end

end