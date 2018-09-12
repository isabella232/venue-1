require 'rails_helper'

RSpec.describe Genre, type: :model do  
  describe 'DB table' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Factory' do
      it 'should have valid Factory' do
        expect(create(:genre)).to be_valid
      end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:performers) }
  end
end
