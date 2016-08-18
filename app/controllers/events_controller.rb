class EventsController < ApplicationController 
	before_action :find_event, only: [:show, :destroy]
  
  def index 
  	user = User.find(params[:user_id])
    if current_user == user
        @events = current_user.events
    else
			flash[:alert] = "You do not have permission to access this page!"
        redirect_to root_path
    end
  end
  
  def show
  end

  def search 
    # create end point from search query and API url
    q = params[:q]
    base_url = "https://www.eventbriteapi.com/v3/events/search?q="
    end_point = base_url + q +"&token=" + ENV["EB_API_TOKEN"]
    request = HTTParty.get(end_point)
    @events = request["events"]
    
    if @events
			render :search
    else
			flash[:alert] = "Sorry, your search came back empty, please try again."
			redirect_to root_path
    end
	end 

  def details 
  	<% simple_form_for([current_user, current_user.movies.build]) do |f| %>  
			<%= f.hidden_field :name, :value => @event_info["Name"] %>
			<%= f.hidden_field :description, :value => @event_info["Description"] %>
			<%= f.button :submit, 'Favorite' %>
		end  
	end 


private 
	def find_event  
		@event = Event.find(params[:id])
	end

	def event_params    
		params.require (:event).permit(:title, :location, :time, :details)
	end   
end 