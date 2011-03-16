class CreateRfidusers < ActiveRecord::Migration
  def self.up
    create_table :rfidusers do |t|
      t.string :name
      t.string :address
      t.integer :cardid
      t.timestamps
    end
  end

  def self.down
    drop_table :rfidusers
  end
end
