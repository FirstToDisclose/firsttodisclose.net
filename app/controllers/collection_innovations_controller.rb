class CollectionInnovationsController < ApplicationController
  def new
    @collection = Collection.find(params[:collection_id])
  end

  def create
    @collection = Collection.find(params[:collection_id])
    @innovation = Innovation.find(params[:innovation_id])
    collection_innovation = CollectionInnovation.new(collection: @collection, innovation: @innovation)
    if collection_innovation.save
      flash[:notice] = "Innovation #{@innovation.title} was successfully added"
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end
end
