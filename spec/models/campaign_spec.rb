require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :location }
  end

end
