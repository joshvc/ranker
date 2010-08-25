class AddWinPercentToTotaloffense < ActiveRecord::Migration
  def self.up
    add_column :totaloffenses, :winpct, :decimal
  end

  def self.down
    remove_column :totaloffenses, :winpct
  end
end
