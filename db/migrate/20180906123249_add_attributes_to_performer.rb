class AddAttributesToPerformer < ActiveRecord::Migration[5.2]
  def change
    add_column :performers, :name, :string
    add_column :performers, :genre, :string
    add_column :performers, :city, :string
    add_column :performers, :description, :string
    add_column :performers, :facebook, :string
    add_column :performers, :instagram, :string
    add_column :performers, :twitter, :string
    add_column :performers, :website, :string
    add_column :performers, :spotify, :string
  end
end
