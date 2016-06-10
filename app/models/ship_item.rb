class ShipItem < ActiveRecord::Base
	validates_presence_of :ship_id, :item_id, :quantity
end
