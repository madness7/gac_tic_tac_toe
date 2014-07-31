module GamesHelper
  
  def board_display(move)
    if move.current_player_id.present?
      return "<img src='/assets/noughts.jpg'/>"
    elsif move.user_id.present?
      return "<img src='/assets/crosses.jpg'/>"
    else 
      return "<a href='/play/" + move.game.id.to_s + "?moveid=" + move.id.to_s + "'></a>" 
    end 
  end
  def find_winner_name(winner_id)
    u = User.find winner_id
    "#{u.user_name}"  
  end

  def calculate_leaderboard
    results = User.all.map do |user|
      winning_games_count = Game.all.select do |game|
        game.winner_id == user.id
      end.count
      [winning_games_count, user.user_name]
    end
   results.sort
  end

end
