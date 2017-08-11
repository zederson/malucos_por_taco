class CreateScout < ActiveRecord::Migration[5.1]
  def change
    create_table :scouts do |t|
      t.integer :run
      t.integer :back
      t.integer :lost_ball
      t.integer :bat_delivery
      t.integer :house
      t.integer :burned
      t.integer :victory
      t.integer :concierge

      t.belongs_to :team, index: true
      t.timestamps
    end
  end
end
