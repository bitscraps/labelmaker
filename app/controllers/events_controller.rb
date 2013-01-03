class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end

  def create
    @event = Event.new()

    if request.post?
      @event = Event.new(params[:event])
      if @event.save
        flash[:notice] = 'Succesfully created new event'
        redirect_to :action => 'index' and return
      end
    end
  end

  def edit
  end

  def destroy
      Event.destroy(params[:id])
      redirect_to :back
  end

  def view
    @event = Event.find_by_id(params[:id])
    @attendees = Attendee.find_all_by_event_id(params[:id])
    @pdf_templates = PdfTemplate.find_all_by_event_id(params[:id])
  end

end
