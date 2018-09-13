require 'rails_helper'

RSpec.describe PerformerPolicy do
    
    let(:user_fan) { create(:user, role: 'fan') }
    let(:user_artist1) { create(:user, email: 'artist1@venue.se', role: 'artist') }
    let(:user_artist2) { create(:user, email: 'artist2@venue.se', role: 'artist') }
    let(:user_admin) { create(:user, role: 'admin') }

    let(:performer) { create(:performer, users: [user_artist1]) }

    context 'user is a fan' do
        subject { described_class.new(user_fan, performer) }
        it { is_expected.to permit_actions [:index, :show] }
        it { is_expected.to forbid_actions [:create, :new, :update, :edit] }
    end
    
    context 'user is artist1 and own Performer and can edit' do
        subject { described_class.new(user_artist1, performer) }
        it { is_expected.to permit_actions [:index, :show, :create, :new, :update, :edit] }
    end

    context 'user is artist2 and can NOT edit Performer' do
        subject { described_class.new(user_artist2, performer) }
        it { is_expected.to permit_actions [:index, :show, :create, :new] }
        it { is_expected.to forbid_actions [:update, :edit] }
    end

    context 'user is an admin' do
        subject { described_class.new(user_admin, performer) }
        it { is_expected.to permit_actions [:index, :show, :create, :new, :update, :edit] }
    end
end