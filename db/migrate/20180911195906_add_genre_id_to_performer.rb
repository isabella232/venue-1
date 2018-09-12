class AddGenreIdToPerformer < ActiveRecord::Migration[5.2]
  def change
    add_column :performers, :genre_id, :string
  end
end
