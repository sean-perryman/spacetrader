require 'rails_helper'

describe ShipItem do	
	describe 'Creating ship items' do
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
				cargo_mod: '1')		

			@item = Item.create(
				name: 'Test',
				base_price: '1')	
		end

		context 'when missing ship id' do
			it 'is invalid' do
				ship_item = ShipItem.new(item_id: @item.id, quantity: '1', ship_id: nil)
				ship_item.valid?
				expect(ship_item.errors[:ship_id]).to include("can't be blank")
			end
		end

		context 'when missing item id' do
			it 'is invalid' do
				ship_item = ShipItem.new(item_id: nil, quantity: '1', ship_id: @player_ship.id)
				ship_item.valid?
				expect(ship_item.errors[:item_id]).to include("can't be blank")
			end
		end

		context 'when missing quantity' do
			it 'is invalid' do
				ship_item = ShipItem.new(item_id: @item.id, quantity: nil, ship_id: @player_ship.id)
				ship_item.valid?
				expect(ship_item.errors[:quantity]).to include("can't be blank")
			end
		end

		context 'with a ship id, item id, and quantity' do
			it 'is valid ' do
				ship_item = ShipItem.new(
					ship_id: @player_ship.id,
					item_id: '1',
					quantity: '1')
				expect(ship_item).to be_valid
			end
		end

		context 'when the ship has no free cargo capacity' do
			it 'is invalid' do
				ship_item = ShipItem.create(
					ship_id: @player_ship.id,
					item_id: @item.id,
					quantity: '5')

				expect(ship_item).to be_invalid
			end
		end

		context 'when the ship has cargo capacity' do
			it 'is valid' do
				ship_item = ShipItem.new(
					ship_id: @player_ship.id,
					item_id: @item.id,
					quantity: '1')

				expect(ship_item).to be_valid
			end
		end
	end
end