class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :Name

      t.timestamps null: false
    end
  end
end
