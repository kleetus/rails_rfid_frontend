class ChangeCardidToString < ActiveRecord::Migration
  def self.up
    remove_column :rfidusers, :cardid
    add_column :rfidusers, :cardid, :string
  end

  def self.down
  end
end
