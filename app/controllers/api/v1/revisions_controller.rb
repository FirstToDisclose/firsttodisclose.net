class Api::V1::RevisionsController < ApplicationController
  def index
    @revisions = Revision.where("innovation_id = ?", params[:innovation_id]).order(:created_at)
    render json: @revisions
  end

  def show
    @revision = Revision.find(params[:id])
    render json: @revision
  end
end
