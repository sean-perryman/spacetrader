class CreatePlayerShips < ActiveRecord::Migration
  def change
    create_table :player_ships do |t|
    	t.belongs_to :player, index: true
      t.belongs_to :ship, index: true
      t.integer :cargo_mod
      
      t.timestamps null: false
    end
  end
end
