class AddRelativeRanks < ActiveRecord::Migration
  def self.up
    add_column :totaloffenses, :yardspergamerr, :decimal
    add_column :totaloffenses, :yardsperplayrr, :decimal
    add_column :totaloffenses, :touchdownsrr, :decimal
  end

  def self.down
    remove_column :totaloffenses, :yardspergamerr
    remove_column :totaloffenses, :yardsperplayrr
    remove_column :totaloffenses, :touchdownsrr
  end
end

