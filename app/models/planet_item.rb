class PlanetItem < ActiveRecord::Base
	validates :planet_id, presence: true
	validates :item_id, presence: true
	validates :price_mod, numericality: { 
													only_integer: true,
													greater_than: '0' }
end
