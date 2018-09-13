class Ticket < ApplicationRecord
    validates_presence_of :price, :name, :count, :sold_count

    belongs_to :campaign



    def increase_sold_count(amount)
        self.sold_count += amount
        self.save
    end
end
