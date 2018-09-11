class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description
    has_and_belongs_to_many :users, :genres
    has_many :campaigns, through: :users
end
 