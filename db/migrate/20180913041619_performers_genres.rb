class PerformersGenres < ActiveRecord::Migration[5.2]
  create_join_table :performers, :genres do |t|
    t.references :performer
    t.references :genre
  end
end
