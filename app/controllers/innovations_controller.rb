class InnovationsController < ApplicationController
  before_action :set_Innovation, only: [:show, :edit, :update, :destroy]

  # GET /Innovations
  # GET /Innovations.json
  def index
    @Innovations = Innovation.all
  end

  # GET /Innovations/1
  # GET /Innovations/1.json
  def show
    @Innovation = Innovation.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @Innovation }
    end
  end

  # GET /Innovations/new
  def new
    @Innovation = Innovation.new
  end

  # GET /Innovations/1/edit
  def edit
  end

  # POST /Innovations
  # POST /Innovations.json
  def create
    @Innovation = Innovation.new(Innovation_params)
    respond_to do |format|
      if @Innovation.save && @Innovation.create_tags(params)
        format.html { redirect_to @Innovation, notice: 'Innovation was successfully created.' }
        format.json { render json: @Innovation, status: :created, location: Innovation_path(@Innovation) }
      else
        format.html { render :new }
        format.json { render json: @Innovation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Innovations/1
  # PATCH/PUT /Innovations/1.json
  def update
    respond_to do |format|
      if @Innovation.update(Innovation_params)
        format.html { redirect_to @Innovation, notice: 'Innovation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @Innovation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Innovations/1
  # DELETE /Innovations/1.json
  def destroy
    @Innovation.destroy
    respond_to do |format|
      format.html { redirect_to Innovations_url, notice: 'Innovation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Innovation
      @Innovation = Innovation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Innovation_params
      params.require(:Innovation).permit(:title, :abstract, :body, :consented)
    end
end
