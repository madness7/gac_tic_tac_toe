class Move < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :current_player_id, :value

  belongs_to :user
  belongs_to :game

end
