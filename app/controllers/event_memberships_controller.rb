class EventMembershipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_event, only: [:index, :create, :update]

  def create
    @event_membership = current_user.event_memberships.build(event: @event)
    if @event_membership.save
      flash[:notice] = "Request sent. Your membership will be official once the event's owner approves it."
      redirect_to event_path(@event)
    else
      render event_path(@event)
    end
  end

  def index
    @memberships = @event.event_memberships
  end

  def update
    @event_membership = EventMembership.find(params[:id])
    if @event_membership.update(approved: !@event_membership.approved)
      flash[:notice] = "Membership Status Updated"
      redirect_to event_memberships_path({ event_id: @event_membership.event.id })
    else
      render event_memberships_path({ event_id: @event_membership.event.id })
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
