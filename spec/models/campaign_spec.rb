require 'rails_helper'

RSpec.describe Campaign, type: :model do
  
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :location }
    it { is_expected.to have_db_column :state }
  end

  describe 'Validates' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :location }
    it { is_expected.to validate_presence_of :state }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:campaign)).to be_valid 
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Attachment' do
    it 'is valid  ' do
      subject.image.attach(io: File.open(fixture_path + '/dummy.jpg'), filename: 'dummy.jpg', content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end

  describe 'Check for states, events and transistions' do
    subject { create(:campaign) }

    it { is_expected.to have_states :pending, :accepted }
    it { is_expected.to handle_events :accept, when: :pending }

    it ':admin_accepts_campaign transitions from :pending to :accepted' do
      subject.accept
      expect(subject.accepted?).to eq true
    end
  end
end
