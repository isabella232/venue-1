require 'rails_helper'

RSpec.describe Performer, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :genre }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :facebook }
    it { is_expected.to have_db_column :instagram }
    it { is_expected.to have_db_column :twitter }
    it { is_expected.to have_db_column :youtube }
    it { is_expected.to have_db_column :website }
    it { is_expected.to have_db_column :spotify }
  end

  describe 'Validates' do
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