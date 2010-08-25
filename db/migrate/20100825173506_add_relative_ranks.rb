class AddRelativeRanks < ActiveRecord::Migration
  def self.up
    add_column :totaloffenses, :yardspergamerr, :decimal
  end

  def self.down
    remove_column :totaloffenses, :yardspergamerr
  end
end

