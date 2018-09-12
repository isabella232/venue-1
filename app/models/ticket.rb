class Ticket < ApplicationRecord
    validates_presence_of :price, :name, :count, :increasing_count

    belongs_to :campaign
end
