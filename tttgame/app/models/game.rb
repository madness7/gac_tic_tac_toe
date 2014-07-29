class Game < ActiveRecord::Base
  attr_accessible :board, :current_player_id, :userwin

  has_many :moves
  has_many :users

end
