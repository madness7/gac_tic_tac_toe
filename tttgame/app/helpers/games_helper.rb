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
end
