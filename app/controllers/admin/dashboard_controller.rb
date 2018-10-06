class Admin::DashboardController < ApplicationController
  layout 'admin'
  def index
    authorize :dashboard, :index?
  
  end
end
