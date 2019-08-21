class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
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
