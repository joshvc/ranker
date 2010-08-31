class CreateTotaldefenses < ActiveRecord::Migration
  def self.up
    create_table :totaldefenses do |t|
      t.string :team
      t.decimal :dgames
      t.decimal :dplays
      t.decimal :dyards
      t.decimal :dyardsperplay
      t.decimal :dyardsperplayrr
      t.decimal :dtouchdowns
      t.decimal :dtouchdownspergame
      t.decimal :dtouchdownspergamerr
      t.decimal :dyardspergame
      t.decimal :dyardspergamerr

      t.timestamps
    end
  end

  def self.down
    drop_table :totaldefenses
  end
end

