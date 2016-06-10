class PlayerShipsController < ApplicationController
  before_action :set_player_ship, only: [:show, :edit, :update, :destroy]

  def index
  	@player_ships = PlayerShip.all
  end

  def show
    @ship_items = ShipItem.where(:ship_id => @player_ship.id)
  end

  def edit
  end

  def new
    @player_ship = PlayerShip.new
  end

  # POST /players
  # POST /players.json
  def create
    @player_ship = PlayerShip.new(player_ship_params)
    respond_to do |format|
      if @player_ship.save
        format.html { redirect_to @player_ship, notice: 'Player Ship was successfully created.' }
        format.json { render :show, status: :created, location: @player_ship }
      else
        format.html { render :new }
        format.json { render json: @player_ship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  # DELETE /ships/1
  # DELETE /ships/1.json
  def destroy
    # Destroy all associated ship items
    ShipItem.where(:ship_id => @player_ship.id).delete_all
    
    @player_ship.destroy
    respond_to do |format|
      format.html { redirect_to player_ships_path, notice: 'Ship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_ship
      @player_ship = PlayerShip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_ship_params
      params.require(:player_ship).permit(:player_id, :ship_id, :cargo_mod)
    end
end
