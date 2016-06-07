class Player < ActiveRecord::Base
	has_one :ship, :through => :player_ships

	def Ship
		Ship.all
	end
end
