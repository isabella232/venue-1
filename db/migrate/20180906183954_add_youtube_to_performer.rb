class AddYoutubeToPerformer < ActiveRecord::Migration[5.2]
  def change
    add_column :performers, :youtube, :string
  end
end
