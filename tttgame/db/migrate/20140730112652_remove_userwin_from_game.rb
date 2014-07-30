class RemoveUserwinFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :userwin
  end

  def down
    add_column :games, :userwin, :string
  end
end
