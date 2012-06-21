class AttendeesController < ApplicationController
  require 'rubygems'
  require 'fastercsv'
  
  def create
    if request.post?
      @attendee = Attendee.create(params[:attendee])
      @attendee.event_id = params[:id]
      @attendee.save
      flash[:notice] = 'Succesfully added new attendee'
      redirect_to :controller => 'events', :action => 'view', :id => params[:id]
    end
  end

  def edit
  end

  def destroy
    Attendee.destroy(params[:id])
    redirect_to :back
  end

  def upload


  	if request.post?
    	@filename = DataFile.save(params[:upload])
      headers = []
      @count = 0

		  FasterCSV.foreach(@filename, :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
          if row[0] == 'fname'
           
            row.each do |column|
              headers.push(column)
            end
          else
            if row[0] != nil
              options = {}
              row.each_with_index do |column, index|
               
                options[headers[index]] = column
              end

              @user = Attendee.new
              @user.fname = row[0]
              @user.lname = row[1]
              @user.options = options
              @user.event_id = params[:id]
              @user.save
              @count += 1
            end
          end


      end

      flash[:notice] = "Succesfully uploaded #{@count} attendees via CSV"
      redirect_to :controller => 'events', :action => 'view', :id => params[:id] and return
    end
  end

end
