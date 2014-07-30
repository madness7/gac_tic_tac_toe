class AddCurrentPlayerIdToMove < ActiveRecord::Migration
  def change
    add_column :moves, :current_player_id, :integer
  end
end
