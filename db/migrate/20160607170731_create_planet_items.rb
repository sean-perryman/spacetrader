class CreatePlanetItems < ActiveRecord::Migration
  def change
    create_table :planet_items do |t|
    	t.belongs_to :item, index: true
      t.belongs_to :planet, index: true
      t.integer :price_mod
      
      t.timestamps null: false
    end
  end
end
