require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :location }

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:campaign)).to be_valid 
    end
  end

end
