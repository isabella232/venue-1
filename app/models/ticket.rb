class Ticket < ApplicationRecord
    validates_presence_of :price, :name

    belongs_to :campaign
end
