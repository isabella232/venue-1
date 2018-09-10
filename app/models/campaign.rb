class Campaign < ApplicationRecord
  validates_presence_of :title, :description, :location, :state

  belongs_to :user
  has_one_attached :image

  state_machine :state, initial: :pending do
    event :accept do
      transition pending: :accepted
    end
  end

  accepts_nested_attributes_for :tickets
end
