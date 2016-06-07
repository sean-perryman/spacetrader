class CreateShipItems < ActiveRecord::Migration
  def change
    create_table :ship_items do |t|
    	t.belongs_to :item, index: true
      t.belongs_to :ship, index: true
      t.integer :quantity
      
      t.timestamps null: false
    end
  end
end
