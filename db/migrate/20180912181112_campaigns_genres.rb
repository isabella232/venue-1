class CampaignsGenres < ActiveRecord::Migration[5.2]
  create_join_table :campaigns, :genres do |t|
    t.references :campaign
    t.references :genre
  end
end
