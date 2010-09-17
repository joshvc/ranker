class CreateRushingoffenses < ActiveRecord::Migration
  def self.up
    create_table :rushingoffenses do |t|
      t.string :team
      t.decimal :rogames
      t.decimal :rushcarries
      t.decimal :rushtotal
      t.decimal :rushyardspergame
      t.decimal :rushtouchdowns
      t.decimal :rushyardsperplay
      t.decimal :rushyardspergamerr
      t.decimal :rushtouchdownspergame
      t.decimal :rushtouchdownspergamerr
      t.decimal :rushyardsperplayrr

      t.timestamps
    end
  end

  def self.down
    drop_table :rushingoffenses
  end
end

