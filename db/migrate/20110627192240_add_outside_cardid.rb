class AddOutsideCardid < ActiveRecord::Migration
  def self.up
    add_column :rfidusers, :outsidecardid, :string
  end

  def self.down
  end
end
