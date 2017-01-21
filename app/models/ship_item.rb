class ShipItem < ActiveRecord::Base
	validates :ship_id, presence: true
	validates :item_id, presence: true
	validates :quantity, presence: true

	# Validate the ship has enough cargo capacity for the item.
	validate :verify_cargo_capacity, :on => :create

	def verify_cargo_capacity
		if self.ship_id # Test for ship_id presence
			player_ship = PlayerShip.find(self.ship_id)

			# Test for valid ship_id and quantity
			if player_ship && player_ship.pre_cap_check(self.quantity)
				true
			else
				errors.add(:ship_item, "Cargo capacity exceeded.")
			end
		else
			errors.add(:ship_item, "Ship ID can't be blank")
		end
	end
end
