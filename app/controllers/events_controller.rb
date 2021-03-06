class EventsController < ApplicationController

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash.now[:info] = "Event created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(:start_date, :description)
    end
end
