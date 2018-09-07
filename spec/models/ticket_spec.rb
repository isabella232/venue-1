require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'DB table' do
  it { is_expected.to validate_presence_of :price }
  end

  describe 'Associations' do
  it { is_expected.to belong_to :campaign }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:campaign)).to be_valid 
    end
  end
end
