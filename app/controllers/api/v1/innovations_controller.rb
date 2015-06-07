class Api::V1::InnovationsController < ApplicationController
  before_action :set_innovation, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :clone_innovation, only: [:update, :destroy]
  before_action :check_if_hidden, only: [:show]
  before_filter :check_privileges!, only: [:new, :create, :edit, :save]
  before_filter :accepted_terms, only: [:new, :create]

  def check_privileges!
    if !user_signed_in?
      render json: { error: "You must authenticate" }.to_json
    end
  end

  def accepted_terms
    unless current_user.accepted_terms
      render json: { error: "You must accept the site terms before continuing" }.to_json
    end
  end

  # GET /api/v1/innovations
  def index
    if !params[:search].blank?
      @innovations = search_innovations
    else
      @innovations = Innovation.visible.paginate(:page => params[:page], :per_page => 20)
    end
    render json: @innovations
  end

  # GET /api/v1/innovations/1
  def show
    @review = Review.new
    render json: @innovation
  end

  # POST /api/v1/innovations
  def create
    @innovation = current_user.innovations.new(innovation_params)
    if @innovation.save && @innovation.create_tags(params)
      render json: @innovation, status: :created, location: innovation_path(@innovation)
    else
      render json: @innovation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/innovations/1
  def update
    if @innovation.update(innovation_params) && @innovation.create_tags(params)
      head :no_content
    else
      render json: @innovation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/innovations/1
  def destroy
    @innovation.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_innovation
    @innovation = Innovation.includes(:collections).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def innovation_params
    params.require(:innovation).permit(:title, :abstract, :body, :consented)
  end

  def clone_innovation
    @innovation.clone
  end

  def check_ownership
    unless current_user.admin? || @innovation.user == current_user
      render json: { error: "You aren't authorized to do that" }.to_json
    end
  end

  def check_if_hidden
    if @innovation.hidden?
      render json: { error: "Innovation is under review by site administrators" }.to_json
    end
  end

  def search_innovations
    search_return = Innovation.visible.basic_search(params[:search])
    if search_return == []
      @innovations = nil
    else
      @innovations = search_return.paginate(:page => params[:page], :per_page => 20)
    end
  end

end
