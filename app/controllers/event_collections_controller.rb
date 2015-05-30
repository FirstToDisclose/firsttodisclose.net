class EventCollectionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @collection = Collection.find(params[:collection_id])
    @event_collection = EventCollection.new
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @event_collection = @collection.event_collections.build(event_collection_params)
    if @event_collection.save
      flash[:notice] = "Collection was added to your event"
      redirect_to @collection
    else
      render :new
    end
  end

  private

  def event_collection_params
    params.require(:event_collection).permit(:event_id)
  end
end
