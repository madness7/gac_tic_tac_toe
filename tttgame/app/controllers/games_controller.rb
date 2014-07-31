class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    # Load moves
    if @game.checkwin?
      @message = "someone won"
    else
      @message = "no winner yet"
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new
# form on new for making a new game, usernames for the players. With button. sends info to create
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        # binding.pry
        (0..8).each do |number|
          Move.create value: number, game_id: @game.id
        end
        # game saved. User redirected to the game where they will see a board
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
  
  def play

    @game = Game.find params["game_id"]
    
    if @game.board.length.even?
       m1 = Move.find params["moveid"]
       m1.current_player_id = m1.game.current_player_id
       m1.save
       @game.board[m1.value] = 0
    else  
       m2 = Move.find params["moveid"]
       m2.user_id = m2.game.user_id
       m2.save 
       @game.board[m2.value] = 1  
    end  
      binding.pry
      redirect_to game_path(@game) 
  end
end
