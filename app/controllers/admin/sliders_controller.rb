class Admin::SlidersController < ApplicationController
  before_action :authenticate_user!

  def create
   @slider = Slider.create(slider_params)
   if @slider.persisted?
    flash[:notice] = 'Your slider has been created'
   end
  end

  def update
  end

  def index
    @sliders = Slider.all
  end

  def new 
    @slider = Slider.new
  end

  private 
  def slider_params
    params.require(:slider).permit(:title, :content, :image, :state)
  end
end
