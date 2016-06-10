class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :base_cargo

      t.timestamps null: false
    end
  end
end
