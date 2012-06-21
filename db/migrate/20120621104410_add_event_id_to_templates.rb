class AddEventIdToTemplates < ActiveRecord::Migration
  def self.up
  	add_column :templates, :event_id, :integer
  end

  def self.down
  	remove_column :templates, :event_id
  end
end
