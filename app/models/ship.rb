class Ship < ActiveRecord::Base
	has_many :player_ships
	has_many :players, :through => :player_ships

	#Player.find(1).ship works!

end
