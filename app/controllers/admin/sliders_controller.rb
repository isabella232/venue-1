class Admin::SlidersController < ApplicationController
  before_action :authenticate_user!

  def create
   @slider = Slider.create(slider_params)
   @sliders = Slider.all
   if @slider.persisted?
    @sliders = Slider.all
    flash[:notice] = 'Your slider has been created'
   end
  end

  def index
    @sliders = Slider.all
  end

  def new 
    @slider = Slider.new
  end

  def destroy 
    slider = Slider.find(params[:id])
    slider.destroy
    @sliders = Slider.all
    flash[:notice] = 'Your slider has been deleted'
  end

  private 
  def slider_params
    params.require(:slider).permit(:title, :content, :image, :state)
  end
end
