class PlayerShipsController < ApplicationController
  def index
  	@player_ships = PlayerShip.all
  end

  def show
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @player_ship = PlayerShip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_ships_params
      params.require(:player_ship).permit(:Name, :Base_Price)
    end
end
