class Move < ActiveRecord::Base
  attr_accessible :game_id, :user_id

  belongs_to :user
  belong_to :game

end
