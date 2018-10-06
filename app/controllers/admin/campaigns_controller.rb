# frozen_string_literal: true

class Admin::CampaignsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @campaigns = Campaign.all
  end

  def update
    campaign = Campaign.find(params[:id])
    if params[:featured]
      campaign.update_attribute(:featured,
                                 ActiveModel::Type::Boolean.new.cast(params[:featured]))

      html = render_to_string('_campaign_table_row', formats: :html, layout: false, locals: { campaign: campaign })
      render json: { message: "Updated #{campaign.title}", html: html }
    end
  end
end
