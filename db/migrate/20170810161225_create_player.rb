class CreatePlayer < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :nick_name
    end
  end
end
