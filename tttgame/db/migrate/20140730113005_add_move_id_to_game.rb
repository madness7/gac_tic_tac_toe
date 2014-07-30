class AddMoveIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :move_id, :integer
  end
end
