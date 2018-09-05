class CampaignPolicy < ApplicationPolicy

    def new?
        user.artist?
    end

    def create?
        new?
    end

    def index?
        true
    end

    def show?
        true
    end
    
end