class Api::V1::CollectionsController < ApplicationController
  def show
    @collection = Collection.includes(:innovations).find(params[:id])
    render json: @collection
  end

  def index
    @collections = Collection.includes(:innovations).all
    render json: @collections
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end
