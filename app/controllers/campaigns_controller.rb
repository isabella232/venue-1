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
      @ticket = @campaign.tickets.create(ticket_params[:tickets_attributes]['0'])
      flash[:notice] = 'Campaign successfully launched'
      redirect_to campaign_path(@campaign)
    else
      render json: {message: 'Additional input required'}, status: 422
    end
  end

  def campaign_tickets
    [@tickets, @campaign]
  end

  def campaign_tickets_attributes=(attributes)
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end

private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :location, :image)
  end

  def ticket_params 
    params.require(:campaign).permit(tickets_attributes: [:id, :price, :name])
  end
end
