class AddCountToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :count, :integer, default: 200
    add_column :tickets, :sold_count, :integer, default: 0
  end
end
