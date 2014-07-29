require 'pry-byebug'

#when implemented within rails, I will be able to use code to record the scores for individual users and present in a scoreboard for them
#@player_one_score = 0
#@player_two_score = 0
# game_over = true
# @user_score += 1

# Greetings and directions:

puts "HELLO!!! This is Tic Tac Toe!"

puts "\nTWO players required for this game"
puts "Player one will be X, and player two will be O."
puts "Player one goes first. and you take it in You must decide who will be players one and two."
puts "You can switch it up if you play again!\n\n"
 
# get and define player info:

puts "PLAYER ONE: What is your name?"
@player_one = gets.chomp
puts "Hello #{@player_one}, you are X. You go FIRST!\n\n"
 

puts "PLAYER TWO: What is your name?"
@player_two = gets.chomp
puts "Hello #{@player_two}, you are O. You go SECOND!\n\n"
 
# creates new hash which represents the cells on the Tic Tac Toe board
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

#2 d array of winning lines, used to simplify the win condition checking. 

@winrows = [
['a1','a2','a3'],
['b1','b2','b3'],
['c1','c2','c3'],
['a1','b1','c1'],
['a2','b2','c2'],
['a3','b3','c3'],
['a1','b2','c3'],
['c1','b2','a3']
]
 # binding.pry
# instance variable for winning pattern 
@winx = " X  X  X "
@wino = " O  O  O "    
 
# prints directions and confirms user understands

puts "DIRECTIONS"
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
    puts "CURRENT BOARD                        CELL NUMBERS"

    print @board[0], "|", @board[1], "|", @board[2], "                             0 | 1 | 2 "
    print "\n____________", "                          ____________\n"
    print @board[3], "|", @board[4], "|", @board[5], "                             3 | 4 | 5 "
    print "\n____________", "                          ____________\n"
    print @board[6], "|", @board[7], "|", @board[8], "                             6 | 7 | 8 "
    puts "\n#{@player_one} is X."
    puts "#{@player_two} is O."
    puts "                     Go for It !!                  "
    
    puts "\n"
end
 
# prints current board
print_board
 
puts "Hit any key to continue!"
gets
 
# method for player one's turn
def player_one_play
    puts "#{@player_one.upcase}: Please choose your square!"
    @play_proc.call
    @board[@play.to_i] = " X " # replace the hash value in board
    puts "Thank you!\n\n"
end
 
# method for player two's turn
def player_two_play
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
while (@winrows[0]) != (@winx && @wino) && 
    (@winrows[1]) != (@winx && @wino) && (@winrows[2]) != (@winx && @wino) && 
    (@winrows[3]) != (@winx && @wino) && (@winrows[4]) != (@winx && @wino) && 
    (@winrows[5]) != (@winx && @wino) && (@winrows[6]) != (@winx && @wino) && 
    (@winrows[8]) != (@winx && @wino)
 
    player_one_play
    print_board
 
        if (@winrows[0]) == @winx || (@winrows[1]) == @winx ||
         (@winrows[2]) == @winx || (@winrows[3]) == @winx ||
         (@winrows[4]) == @winx || (@winrows[5]) == @winx || 
         (@winrows[6]) == @winx || (@winrose[7]) == @winx
 
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

            if (@winrows[0])== @wino || (@winrows[1]) == @wino ||
           (@winrows[2]) == @wino || (@winrows[3]) == @wino ||
           (@winrows[4]) == @wino || (@winrows[5]) == @wino || 
           (@winrose[6]) == @wino || (@winrose[7]) == @wino
 
                 puts "Good Effort, #{@player_two.upcase}, You Win!!!"
                puts "WTF, #{@player_one}.  Loser!!!."
 
            end
        end
end


