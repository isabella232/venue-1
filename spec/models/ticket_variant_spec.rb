require 'rails_helper'

RSpec.describe TicketVariant, type: :model do
  describe 'DB table' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :base_price_percentage }
  end
  
  describe 'Validates associated' do
    let(:ticket) { create(:ticket) }
    let!(:ticket_variants) { 3.times { create(:ticket_variant, ticket: ticket) } }

    it 'invalidates 4th ticket variant' do
      create(:ticket_variant, ticket: ticket)
      ticket.reload
      expect(ticket).not_to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :ticket }
  end

  describe 'Instance methods' do
    it { is_expected.to respond_to :count }
    it { is_expected.to respond_to :price }
  end
end
