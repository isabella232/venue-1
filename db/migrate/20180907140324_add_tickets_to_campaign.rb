class AddTicketsToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_reference :campaigns, :tickets, foreign_key: true
    add_reference :tickets, :campaign, foreign_key: true
  end
end
