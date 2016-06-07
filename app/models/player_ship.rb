class PlayerShip < ActiveRecord::Base
	belongs_to :player
	belongs_to :ship
end
