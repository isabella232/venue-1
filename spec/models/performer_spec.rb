require 'rails_helper'

RSpec.describe Performer, type: :model do

  describe 'DB table' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :genre }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :description }
  end
  
  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many :user }
  end
  
  describe "Factory" do
    it "for :user is valid" do
      expect(create(:performer)).to be_valid
    end
  end
end