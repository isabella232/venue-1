require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Associations' do
    it { is_expected.to acts_as_shopping_cart_using :order_item }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:order)).to be_valid 
    end
  end
end
