class CreatePassingoffenses < ActiveRecord::Migration
  def self.up
    create_table :passingoffenses do |t|
      t.string :team
      t.decimal :pogames
      t.decimal :passattempts
      t.decimal :passcompletions
      t.decimal :passinterceptions
      t.decimal :passinterceptionspergame
      t.decimal :passpercentage
      t.decimal :passyards
      t.decimal :passyardsperattempt
      t.decimal :passyardsperattemptrr
      t.decimal :passtouchdowns
      t.decimal :passtouchdownspergame
      t.decimal :passtouchdownspergamerr
      t.decimal :passyardspergame
      t.decimal :passyardspergamerr
      t.decimal :passinterceptionspct
      t.decimal :passinterceptionspctrr
      t.decimal :passyardspercompletion
      t.decimal :passyardspercompletionrr



      t.timestamps
    end
  end

  def self.down
    drop_table :passingoffenses
  end
end

