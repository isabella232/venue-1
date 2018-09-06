class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description, :facebook, :instagram, :twitter, :website, :spotify

    has_and_belongs_to_many :user
end
