require 'rails_helper'

RSpec.describe TicketVariant, type: :model do
  describe 'DB table' do
    it { is_expected.to validate_presence_of :name } 
    it { is_expected.to validate_presence_of :base_price_percentage } 

    describe 'Validates associated' do
      it { is_expected.to validates_associated :ticket }
    end
    
    describe 'Associations' do
    it { is_expected.to belong_to :ticket }

    describe 'Responds to' do
      it { is_expected.to respond_to(:count) }
      it { is_expected.to respond_to(:price) }
    end

    end
  end
end
