class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @event = Event.includes(:collections).find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:notice] = "Event created successfully"
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :street_1, :street_2, :city, :state, :postal_code)
  end
end
