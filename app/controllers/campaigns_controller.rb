class CampaignsController < ApplicationController

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.persisted?
      redirect_to root_path
    else
      render :new
    end
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :location)
  end
end
