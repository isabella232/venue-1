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
    @campaign = current_user.campaigns.create(campaign_params)
    if @campaign.persisted?
      flash[:notice] = 'Campaign successfully launched'
      redirect_to campaign_path(@campaign)
    else
      render json: {message: "Additional input required"}, status: 422
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  #def update
  #  campaign = Campaign.find(params[:id])
  #  if params[:event] == 'admin_accepts_campaign'
  #    campaign.admin_accepts_campaign!
  #  end
  #end
  
  def admin_accepts_campaign
    @campaign = Campaign.find(params[:id])
    if params[:event] == 'admin_accepts_campaign'
      @campaign.admin_accepts_campaign!
    end
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :location, :image, :state)
  end
end
