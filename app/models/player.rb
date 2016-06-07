class Player < ActiveRecord::Base
	has_one :player_ship
	has_one :ship, :through => :player_ship

	def Ship

	end
end
