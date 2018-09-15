class AddDateToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :venue_date, :date
  end
end
