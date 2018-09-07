class Ticket < ApplicationRecord
    validates_presence_of :price

    belongs_to :campaigns
end
