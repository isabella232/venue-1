class ApplicationPolicy
  attr_reader :current_user, :record

  def initialize(current_user, record)
    @user = user
    @record = record
  end

  def new?
    current_user.artist?
  end
end
