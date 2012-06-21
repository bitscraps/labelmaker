class PdfTemplatesController < ApplicationController
  def create
  	@pdf_template = PdfTemplate.new

  	if request.post?
  		@pdf_template = PdfTemplate.new(params[:pdf_template])
  		@pdf_template.event_id = params[:id]
  		@pdf_template.save
  		flash[:notice] = 'Succesfully created new PDF Template'
  		redirect_to :action => 'edit', :id => @pdf_template.id and return
  	end 
  end

  def edit
  end

  def destroy
  	@event = PdfTemplate.find_by_id(params[:id]).event_id
  	PdfTemplate.destroy(params[:id])
  	flash[:notice] = 'Successfully deleted template'
  	redirect_to :controller => 'events', :action => 'view', :id => @event
  end

  def view
  	
  end

end
