class SessionsController < Devise::SessionsController
  respond_to :js

  def new
    super
  end

  def create
    super
  end

end
