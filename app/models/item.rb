class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :base_price, presence: true
end
