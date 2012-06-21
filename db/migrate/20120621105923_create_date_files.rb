class CreateDateFiles < ActiveRecord::Migration
  def self.up
    create_table :date_files do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :date_files
  end
end
