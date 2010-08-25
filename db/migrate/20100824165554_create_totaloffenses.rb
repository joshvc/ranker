class CreateTotaloffenses < ActiveRecord::Migration
  def self.up
    create_table :totaloffenses do |t|
      t.string :team
      t.integer :games
      t.integer :yards
      t.integer :plays
      t.decimal :yardsperplay
      t.integer :touchdowns
      t.decimal :yardspergame
      t.integer :wins
      t.integer :losses
      t.integer :ties

      t.timestamps
    end
  end

  def self.down
    drop_table :totaloffenses
  end
end

