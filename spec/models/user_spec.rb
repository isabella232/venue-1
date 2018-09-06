require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "DB table" do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }

  end

  describe "Factory" do
    it "for :user is valid" do
      expect(create(:user)).to be_valid
    end
  end

  describe 'User roles' do
    let(:user_fan) {create :user, role: :fan}
    let(:user_artist) {create :user, role: :artist}

    it 'fan responds true if role is fan' do
      expect(user_fan.fan?).to eq true
    end

    it 'fan responds false if role is not fan' do
      expect(user_fan.artist?).to eq false
    end
    
    it 'artist responds true if role is artist' do
      expect(user_artist.artist?).to eq true
    end

    it 'artist responds false if role is not artist' do
      expect(user_artist.fan?).to eq false
    end
  end
end
