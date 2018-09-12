class CampaignPolicy < ApplicationPolicy

    def new?
        !user.fan?
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
    
    def edit?
        user.admin?
    end
    
    def update?
        edit?
    end
end