class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
        @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.persisted?
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :location)
  end
end
