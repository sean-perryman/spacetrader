class PlayerShipsController < ApplicationController
  before_action :set_player_ship, only: [:show, :edit, :update, :destroy]

  def index
  	@player_ships = PlayerShip.all
  end

  def show
    @ship_items = ShipItem.where(:ship_id => @player_ship.ship)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_ship
      @player_ship = PlayerShip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_ships_params
      params.require(:player_ship).permit(:player, :ship, :cargo_mod)
    end
end
