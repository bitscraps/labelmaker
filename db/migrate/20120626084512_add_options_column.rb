class AddOptionsColumn < ActiveRecord::Migration
  def self.up
  	add_column :templates, :template_options, :text
  end

  def self.down
  	remove_column :templates, :template_options
  end
end
