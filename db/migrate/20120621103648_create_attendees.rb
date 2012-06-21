class CreateAttendees < ActiveRecord::Migration
  def self.up
    create_table :attendees do |t|
      t.string :fname
      t.string :lname
      t.text :options
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attendees
  end
end
