class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description, :state
    has_and_belongs_to_many :users
    has_and_belongs_to_many :genres
    has_many :campaigns, through: :users

    state_machine :state, initial: :active do 
        event :archive do
            transition active: :archived
        end
    end

end
 