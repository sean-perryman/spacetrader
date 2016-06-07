class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :Name
      t.integer :Base_Cargo

      t.timestamps null: false
    end
  end
end
