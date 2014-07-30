class RemoveCurrentPlayerIdFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :current_player_id
  end

  def down
    add_column :games, :current_player_id, :string
  end
end
