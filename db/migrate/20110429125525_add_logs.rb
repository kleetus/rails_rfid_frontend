class AddLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.timestamps :timestamp
      t.string :cardid
      t.string :serveranswer
    end
  end

  def self.down
    drop_table :logs
  end
end
