class CollectionsController < ApplicationController
  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      flash[:notice] = "Collection was successfully created"
      redirect_to collection_path(@collection)
    else
      render :new
    end
  end

  def show
    @collection = Collection.includes(:innovations).find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @collection }
    end
  end

  def index
    @collections = Collection.includes(:innovations).all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @collections }
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  private

  def collection_params
    params.require(:collection).permit(:title)
  end
end
