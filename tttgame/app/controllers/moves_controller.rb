class MovesController < ApplicationController
  # GET /moves
  # GET /moves.json
  def index # Doesnt make sense?!
    @moves = Move.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.json
  def show # Doesnt make sense?!
    @move = Move.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.json
  def new # Doesnt make sense?!
    @move = Move.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @move }
    end
  end

  # GET /moves/1/edit
  def edit # Doesnt make sense?!
    @move = Move.find(params[:id])
  end

  # POST /moves
  # POST /moves.json
  def create
    @move = Move.new(params[:move])

    # create new move - value of the move e.g 0-8, letter of the move X or O, user that made the move, game_id, saved to the db at the save
    # VALIDATIONS - 

    respond_to do |format|
      if @move.save

        # Check game status, is there a winner?
        # If there is a winner - change game status to game over, add user_ids to winner/loser columns
        # Go back to the game show page

      #   format.html { redirect_to @move, notice: 'Move was successfully created.' }
      #   format.json { render json: @move, status: :created, location: @move }
      # else
      #   format.html { render action: "new" }
      #   format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moves/1
  # PUT /moves/1.json
  def update # Doesnt make sense?!
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        format.html { redirect_to @move, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.json
  def destroy # Doesn't make sense?!
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to moves_url }
      format.json { head :no_content }
    end
  end
end
