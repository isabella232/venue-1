class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description
    has_and_belongs_to_many :user
    has_and_belongs_to_many :genre
end
