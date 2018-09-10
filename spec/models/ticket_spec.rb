require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'DB table' do
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :name }
end

  describe 'Associations' do
  it { is_expected.to belong_to :campaign }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:ticket)).to be_valid 
    end
  end
end
