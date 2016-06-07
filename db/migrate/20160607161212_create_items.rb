class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :Name
      t.integer :Base_Price

      t.timestamps null: false
    end
  end
end
