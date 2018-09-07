class Campaign < ApplicationRecord
    validates_presence_of :title, :description, :location 
    
    belongs_to :user
    has_one_attached :image
end