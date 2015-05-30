class CollectionsController < ApplicationController
  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
    check_for_event
    if @collection.save
      flash[:notice] = "Collection was successfully created"
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def show
    @collection = Collection.includes(:innovations).find(params[:id])
  end

  def index
    @collections = Collection.includes(:innovations).all
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end

  def check_for_event
    if !params[:collection][:event_id].blank?
      event = Event.find(params[:collection][:event_id])
      EventCollection.create(event: event, collection: @collection)
    end
  end
end
