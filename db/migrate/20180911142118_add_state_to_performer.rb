class AddStateToPerformer < ActiveRecord::Migration[5.2]
  def change
    add_column :performers, :state, :string
  end
end
