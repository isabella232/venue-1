require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:order)).to be_valid 
    end
  end
end
