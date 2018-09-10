class Performer < ApplicationRecord
    validates_presence_of :name, :genre, :city, :description
    has_and_belongs_to_many :user
    #make this happend
    has_many :campaigns, through: :user
end
