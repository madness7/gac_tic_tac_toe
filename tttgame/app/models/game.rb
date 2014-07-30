class Game < ActiveRecord::Base
  attr_accessible :move_id, :winner_id, :loser_id, :status, :user_id, :creator_id 

  has_many :moves
  has_many :users

end
