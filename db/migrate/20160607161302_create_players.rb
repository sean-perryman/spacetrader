class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :Name
      t.integer :Credits

      t.timestamps null: false
    end
  end
end
