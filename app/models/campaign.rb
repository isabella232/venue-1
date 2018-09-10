class Campaign < ApplicationRecord
  validates_presence_of :title, :description, :location

  belongs_to :user
  # make this happend
  has_one :performer
  has_one_attached :image

  has_many :tickets
  accepts_nested_attributes_for :tickets
end
