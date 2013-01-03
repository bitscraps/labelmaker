class PdfTemplatesController < ApplicationController
  require "yaml"

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
  		@pdf_template = PdfTemplate.find_by_id(params[:id])

      if request.post?
        if params[:datafile]
          @filename = DataFile.save(params)
          params[:options][:background] = @filename
          @pdf_template.save
        else
          @pdf_template.template_options = params[:options]
          @pdf_template.save
        end
      end
  end

  def destroy
  	@event = PdfTemplate.find_by_id(params[:id]).event_id
  	PdfTemplate.destroy(params[:id])
  	flash[:notice] = 'Successfully deleted template'
  	redirect_to :controller => 'events', :action => 'view', :id => @event
  end

  def merge
    #1mm ~= 4.2 px
    @attendees = Attendee.find_all_by_event_id_and_fname_and_lname(params[:event_id], 'David', 'Taylor', :order => "lname,fname")
    @count = 1
    

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "namebadges", 
               :template => "pdf_templates/merge.pdf.erb",
               :layout => "pdf"
      end
    end
  end

  def placecards
    #1mm ~= 4.2 px
    @attendees = Attendee.find_all_by_event_id(params[:event_id], :order => "lname,fname")
    @count = 1

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "placecards", 
               :template => "pdf_templates/placecards.pdf.erb",
               :layout => "pdf"
      end
    end
  end
end
