class PerformerPolicy < ApplicationPolicy

    def new?
        !user.fan?
    end

    def create?
        new?
    end
    
    def edit?
        user.artist? && record.users.ids.include?(user.id) || user.admin?
    end

    def update?
        edit?
    end
end