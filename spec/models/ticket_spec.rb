require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'DB table' do
  it { is_expected.to validate_presence_of :price }
  end

  describe 'Associations' do
  #  it { is_expected.to belong_to :campaigns }
  end
end
