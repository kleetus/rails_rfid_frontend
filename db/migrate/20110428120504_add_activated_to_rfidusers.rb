class AddActivatedToRfidusers < ActiveRecord::Migration
  def self.up
    add_column :rfidusers, :activated, :integer
  end

  def self.down
  end
end
