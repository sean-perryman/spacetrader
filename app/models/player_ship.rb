class PlayerShip < ActiveRecord::Base
	belongs_to :player
	belongs_to :ship

	validates :ship_id, presence: true
	validates :player_id, presence: true
	validates :cargo_mod, presence: true

	def cargo_capacity
		if self.cargo_mod
			self.cargo_mod + self.ship.base_cargo
		elsif !self.ship.base_cargo.nil?
			self.ship.base_cargo
		else
			0
		end
	end

	def player_and_ship
		self.player.name + ": " + self.ship.name
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
