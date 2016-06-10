require 'rails_helper'

describe Item do
	it "is valid with both a name and a base_price" do
		item = Item.new(
				name: '1',
				base_price: '1')

		expect(item).to be_valid
	end
	
	it "is invalid without a name" do
		item = Item.new(name: nil)
		item.valid?
		expect(item.errors[:name]).to include("can't be blank")
	end

	it "is invalid without a base_price" do
		item = Item.new(base_price: nil)
		item.valid?
		expect(item.errors[:base_price]).to include("can't be blank")
	end

end