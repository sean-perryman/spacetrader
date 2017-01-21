require 'rails_helper'

describe PlayerShip do
	it 'is valid with player_id, ship_id, and cargo_mod' do
		player_ship = PlayerShip.new(
				ship_id: '1',
				player_id: '1',
				cargo_mod: '0')

		expect(player_ship).to be_valid
	end
	
	it 'is invalid without player_id' do
		player_ship = PlayerShip.new(player_id: nil)
		player_ship.valid?
		expect(player_ship.errors[:player_id]).to include("can't be blank")
	end

	it 'is invalid without ship_id' do
		player_ship = PlayerShip.new(ship_id: nil)
		player_ship.valid?
		expect(player_ship.errors[:ship_id]).to include("can't be blank")
	end

	it 'is invalid without cargo_mod'do
		player_ship = PlayerShip.new(cargo_mod: nil)
		player_ship.valid?
		expect(player_ship.errors[:cargo_mod]).to include("can't be blank")
	end

	describe "model methods" do
		before :each do
			@ship = Ship.create( #Use create when you need test data to persist.
				name: 'Test',
				base_cargo: '1')

			@player = Player.create(
				name: 'Test',
				credits: '0')

			@player_ship = PlayerShip.create(
					ship_id: @ship.id,
					player_id: @player.id,
					cargo_mod: '2')
		end

		context 'player and ship method' do
			it 'returns the complete player and ship name strings, concatenated by a colon' do
				expect(@player_ship.player_and_ship).to eq 'Test: Test'
			end
		end
	end
end