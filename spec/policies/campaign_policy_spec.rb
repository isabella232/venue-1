require 'rails_helper'
 
RSpec.describe CampaignPolicy do
    subject { described_class.new(user, campaign) }
    let(:campaign) { create(:campaign) }
     
    context 'user is a fan' do
        let(:user) { create(:user, role: 'fan') }
        it { is_expected.to permit_actions [:index, :show] }
        it { is_expected.to forbid_actions [:create, :new, :update] }
    end
    
    context 'user is an artist' do
        let(:user) { create(:user, role: 'artist') }
        it { is_expected.to permit_actions [:index, :show, :create, :new] }
        it { is_expected.to forbid_actions [:update] }
    end

    context 'user is an admin' do
        let(:user) { create(:user, role: 'admin') }
        it { is_expected.to permit_actions [:index, :show, :create, :new, :update] }
    end
end