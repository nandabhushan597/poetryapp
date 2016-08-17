class EventsController < ApplicationController 
	before_action :find_event only:[:show, :destroy]
  def index
  end

  def show
  end

  def search 
  	binding.pry 
  end

  def details
  end 

private 
	def find_event  
		@event = Event.find(params[:id])
	end

	def event_params    
		params.require (:event).permit(:title, :location, :time, :details)
	end   
end 