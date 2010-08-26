class ChangeIntegersToDecimals < ActiveRecord::Migration
  def self.up
    change_column :totaloffenses, :yards, :decimal
    change_column :totaloffenses, :touchdowns, :decimal
    change_column :totaloffenses, :games, :decimal
    change_column :totaloffenses, :plays, :decimal
    change_column :totaloffenses, :wins, :decimal
    change_column :totaloffenses, :losses, :decimal
    change_column :totaloffenses, :ties, :decimal
    add_column :totaloffenses, :touchdownspergame, :decimal
    add_column :totaloffenses, :touchdownspergamerr, :decimal
  end

  def self.down
    change_column :totaloffenses, :yards, :integer
    change_column :totaloffenses, :touchdowns, :integer
    change_column :totaloffenses, :games, :integer
    change_column :totaloffenses, :plays, :integer
    change_column :totaloffenses, :wins, :integer
    change_column :totaloffenses, :losses, :integer
    change_column :totaloffenses, :ties, :integer
    remove_column :totaloffenses, :touchdownspergame
    remove_column :totaloffenses, :touchdownspergamerr
  end
end

