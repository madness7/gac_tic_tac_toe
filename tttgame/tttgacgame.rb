#when implemented within rails, I will be able to use code to record the scores for individual users and present in a scoreboard for them
#@player_one_score = 0
#@player_two_score = 0
# game_over = true
# @user_score += 1
 
# @line = "==============================================================="
# @header =  "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
 
# Greetings and directions:
# puts "\n\n" + @header
# puts @line
puts "HELLO!!! Welcome to Ruby Tic Tac Toe!"
# puts @line
# puts @header
puts "\nTWO players required for this game"
puts "Player one will be X, and player two will be O."
puts "Player one goes first. and you take it in You must decide who will be players one and two."
puts "You can switch it up if you play again!\n\n"
 
# get and define player info:
# puts @line
puts "PLAYER ONE: What is your name?"
@player_one = gets.chomp
puts "Hello #{@player_one}, you are X. You go FIRST!\n\n"
 
# puts @line
puts "PLAYER TWO: What is your name?"
@player_two = gets.chomp
puts "Hello #{@player_two}, you are O. You go SECOND!\n\n"
 
# creates new hash which represents the board's tiles
@board = {
    0 => "   ",
    1 => "   ",
    2 => "   ",
    3 => "   ",
    4 => "   ",
    5 => "   ",
    6 => "   ",
    7 => "   ",
    8 => "   ",
    }
 
# instance variable for winning pattern 
@winx = " X  X  X "
@wino = " O  O  O "    
 
# prints directions and confirms user understands
# puts @line
puts "DIRECTIONS"
# puts @line
puts "The board's numbers are as follows:\n\n"
puts " 0 | 1 | 2 "
puts "____________"
puts " 3 | 4 | 5 "
puts "____________"
puts " 6 | 7 | 8 \n\n"
puts "Follow the on-screen instructions..\n"
puts "For reference, the cells numbers are shown above."
puts @line
puts "\nHit any key to continue!"
gets    
 
# method that prints current board
def print_board    
    puts "\n\nCurrent Board, and the square numbers!"
    # puts @line
    puts "CURRENT BOARD                        CELL NUMBERS"
    # puts @line
    print @board[0], "|", @board[1], "|", @board[2], "                             0 | 1 | 2 "
    print "\n____________", "                          ____________\n"
    print @board[3], "|", @board[4], "|", @board[5], "                             3 | 4 | 5 "
    print "\n____________", "                          ____________\n"
    print @board[6], "|", @board[7], "|", @board[8], "                             6 | 7 | 8 "
    puts "\n#{@player_one} is X."
    puts "#{@player_two} is O."
    # puts @line
    puts "                     Go for It !!                  "
    # puts @line
    puts "\n"
end
 
# prints current board
print_board
 
puts "Hit any key to continue!"
gets
 
# method for player one's turn
def player_one_play
    # puts @line
    puts "#{@player_one.upcase}: Please choose your square!"
    @play_proc.call
    @board[@play.to_i] = " X " # replace the hash value in board
    puts "Thank you!\n\n"
end
 
# method for player two's turn
def player_two_play
    # puts @line
    puts "#{@player_two.upcase}: Please choose your square!"
    @play_proc.call
    @board[@play.to_i] = " O " # replace the hash value in board
    puts "Thank you!\n\n"
end
 
@play_proc = Proc.new do 
    puts "Choose Your Square: "
    @play = gets.chomp
    until @board[@play.to_i] == "   " # error message when user chooses cell that is already taken
        puts "WHOOPS! That cell is already taken. Please try again: "
        @play = gets.chomp
    end
end    
 
# continually checks for a winning condition untill there is a tie
while (@board[0] + @board[1] + @board[2]) != (@winx && @wino) && 
    (@board[3] + @board[4] + @board[5]) != (@winx && @wino) && (@board[6] + @board[7] + @board[8]) != (@winx && @wino) && 
    (@board[0] + @board[3] + @board[6]) != (@winx && @wino) && (@board[1] + @board[4] + @board[7]) != (@winx && @wino) && 
    (@board[2] + @board[5] + @board[8]) != (@winx && @wino) && (@board[0] + @board[4] + @board[8]) != (@winx && @wino) && 
    (@board[6] + @board[4] + @board[2]) != (@winx && @wino)
 
    player_one_play
    print_board
 
        if (@board[0] + @board[1] + @board[2]) == @winx || (@board[3] + @board[4] + @board[5]) == @winx ||
         (@board[6] + @board[7] + @board[8]) == @winx || (@board[0] + @board[3] + @board[6]) == @winx ||
         (@board[1] + @board[4] + @board[7]) == @winx || (@board[2] + @board[5] + @board[8]) == @winx || 
         (@board[0] + @board[4] + @board[8]) == @winx || (@board[6] + @board[4] + @board[2]) == @winx
 
            puts "Good Effort, #{@player_one.upcase}, You Win!!!"
            puts "WTF!!, #{@player_two}.  Loser!!!."
            puts "THE END\n\n"
            break # if player one is the winner
 
        elsif @board.has_value?("   ") == false
 
            puts "Neither of you won.  You, #{@player_one} and #{@player_two} are BOTH LOSERS!!."
            puts "So Mote It Be\n\n"
            break # if no more empty spaces left on the board
 
        else
 
            player_two_play
            print_board
 
            if (@board[0] + @board[1] + @board[2])== @wino || (@board[3] + @board[4] + @board[5]) == @wino ||
           (@board[6] + @board[7] + @board[8]) == @wino || (@board[0] + @board[3] + @board[6]) == @wino ||
           (@board[1] + @board[4] + @board[7]) == @wino || (@board[2] + @board[5] + @board[8]) == @wino || 
           (@board[0] + @board[4] + @board[8]) == @wino || (@board[6] + @board[4] + @board[2]) == @wino
 
                 puts "Good Effort, #{@player_two.upcase}, You Win!!!"
                puts "WTF, #{@player_one}.  Loser!!!."
 
            end
        end
end


