class CampaignPolicy < ApplicationPolicy

    def new?
        user.artist?
    end

    def create?
        user.artist?
    end

    def index?
        true
    end

    def show?
        true
    end
    
end