class PdfTemplate < ActiveRecord::Base
	belongs_to :event
	set_table_name 'templates'
end
