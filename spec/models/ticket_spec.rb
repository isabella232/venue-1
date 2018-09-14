require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'DB table' do
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :count }
  it { is_expected.to validate_presence_of :sold_count }
end

  describe 'Associations' do
  it { is_expected.to belong_to :campaign }
  it { is_expected.to have_many :ticket_variants }
  end

  describe 'Validates length of' do
    it { is_expected.to validate_length_of :ticket_variants }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:ticket)).to be_valid 
    end
  end
end

