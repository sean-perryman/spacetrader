class PlayerShip < ActiveRecord::Base
	belongs_to :player
	belongs_to :ship

	def cargo_capacity
		if self.cargo_mod
			self.cargo_mod + self.ship.Base_Cargo
		else
			self.ship.Base_Cargo
		end
	end

	def player_and_ship
		self.player.Name + ": " + self.ship.Name
	end

	def cargo_total
		total = 0
		ShipItem.where(:ship_id => self.id).each do |item|
			total = total + item.quantity
		end
		total
	end

	def capacity_check
		if cargo_capacity > cargo_total 
			true # Within limits
		else
			false # At or beyond capacity
		end
	end
end
