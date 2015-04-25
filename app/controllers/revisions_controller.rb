class RevisionsController < ApplicationController
  def index
    @revisions = Revision.where("innovation_id = ?", params[:innovation_id])
  end
end
