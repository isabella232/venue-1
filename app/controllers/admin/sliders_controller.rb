class Admin::SlidersController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def update
  end

  def index
    @sliders = Slider.all
  end
end
