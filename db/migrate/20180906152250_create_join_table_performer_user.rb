class CreateJoinTablePerformerUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :performers, :users do |t|
       t.index [:performer_id, :user_id]
    end
  end
end
