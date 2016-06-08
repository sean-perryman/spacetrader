class PlayerShip < ActiveRecord::Base
	belongs_to :player
	belongs_to :ship

	def cargo_total
		if self.cargo_mod
			self.cargo_mod + self.ship.Base_Cargo
		else
			self.ship.Base_Cargo
		end
	end
end
