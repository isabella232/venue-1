class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description, :facebook, :instagram, :twitter, :website, :spotify

    belongs_to :user
end
