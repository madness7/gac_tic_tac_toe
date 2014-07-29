class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :current_player_id
      t.string :board
      t.string :userwin

      t.timestamps
    end
  end
end
