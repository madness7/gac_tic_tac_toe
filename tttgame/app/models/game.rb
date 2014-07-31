class Game < ActiveRecord::Base
  attr_accessible :move_id, :winner_id, :loser_id, :status, :user_id, :creator_id, :current_player_id 
  attr_accessor :status


  has_many :moves
  has_many :users

  def board
    @@board ||= {}
  end

  WINROWS = [
  ['0','1','2'],
  ['3','4','5'],
  ['6','7','8'],
  ['0','3','6'],
  ['1','4','7'],
  ['2','5','8'],
  ['0','4','8'],
  ['6','4','2']
  ]

  def checkwin?
    WINROWS.each do |solution_array|
      result1 = board[solution_array[0].to_i]
      result2 = board[solution_array[1].to_i]
      result3 = board[solution_array[2].to_i]
    
      if result1.present? && (result1 == result2) && (result2 == result3)
        return true
      end
    end
    return false
  end
end
