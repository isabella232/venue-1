require 'rails_helper'

RSpec.describe Campaign, type: :model do
  
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :location }
  end
  
  describe 'Validates' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :location }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:campaign)).to be_valid 
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :tickets }
  end

  describe 'Attachment' do
    it 'is valid  ' do
      subject.image.attach(io: File.open(fixture_path + '/dummy.jpg'), filename: 'dummy.jpg', content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end
end
