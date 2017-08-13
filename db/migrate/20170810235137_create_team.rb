class CreateTeam < ActiveRecord::Migration[5.1]
  def change
    create_table :teams, &:timestamps

    create_table :integrants, id: false do |t|
      t.belongs_to :team, index: true
      t.belongs_to :player, index: true
      t.timestamps
    end
  end
end
