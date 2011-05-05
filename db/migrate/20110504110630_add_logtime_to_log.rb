class AddLogtimeToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :logtime, :datetime
  end

  def self.down
  end
end
