class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :genre, :string
    add_column :users, :city, :string
    add_column :users, :description, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
    add_column :users, :twitter, :string
    add_column :users, :website, :string
    add_column :users, :spotify, :string
  end
end
