class RemoveBoardFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :board
  end

  def down
    add_column :games, :board, :string
  end
end
