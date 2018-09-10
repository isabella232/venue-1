class AddStateToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :state, :string
  end
end
